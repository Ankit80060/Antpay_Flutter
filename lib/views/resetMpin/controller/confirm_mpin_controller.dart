import 'dart:convert';

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/AccountTransfer/CustomerFundTransferRequest.dart';
import 'package:antpay_lite/model/AccountTransfer/VerifyW2ACredentialsRequest.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_account_beneficiary_request.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_fetch_beneficiary.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/account_transfer/account_transfer_failure_scuccess_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmMpinController extends GetxController {
  TextEditingController mpinController = TextEditingController();
  CommonApiRepo repoClass = CommonApiRepo();

  var isLoading = false.obs;

  Future<CustomerFetchBeneficiaryResponse?> verifyW2ACredential(
      VerifyW2ACredentialsRequest data,
      BeneficiaryData beneficiaryData,
      String mPin) async {
    try {
        Get.dialog(
      const Center(child: Customloader()),
      barrierDismissible: false,
    );
      CustomerFetchBeneficiaryResponse response =
          await repoClass.verifyW2ACredential(data);
      print("responses${response.responseCode}");
      if (response.responseCode == "00") {
        if (SessionManager().getFromScreen() == "Account Transfer") {
          processW2A(data, beneficiaryData, mPin);
        } else {
          processW2W(data, beneficiaryData, mPin);
        }
      } else {
        CustomToast.show("MPIN has been Expired!");
      }

      return response;
    } catch (e) {
      debugPrint("verifyW2ACredential error: $e");
      CustomToast.show("Something went wrong!");
      return null;
    } finally {
        if (Get.isDialogOpen ?? false) Get.back();
    }
  }

  Future<void> processW2A(VerifyW2ACredentialsRequest data,
      BeneficiaryData beneficiaryData, String mPin) async {
    try {
      final request = CustomerAccountBeneficiaryRequest(
        customerMobile: SessionManager().getMobile().toString() ?? "",
        beneficiaryMobile: beneficiaryData.mobileNumber.toString(),
        bankAccountNumber: beneficiaryData.bankAccountNumber..toString(),
        beneficiaryIFSC: beneficiaryData.ifscCode.toString(),
        paymentDescription: "Direct IMPS",
        transferType: 2,
        amount: SessionManager().getValue(),
        currency: "INR",
        mpin: mPin,
        deviceId: SessionManager().getDeviceId(),
        beneficiaryName: beneficiaryData.beneficiaryName.toString(),
        customerId: SessionManager().getPayUCustomerId(),
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile()?.toString() ?? ""),
        requestIp: SessionManager().getDeviceIpAddress()?.toString() ?? "",
        token: SessionManager().getPayUCustomerWalletTransferToken(),
      );
      print("processRequest$request");
      final processResponse = await repoClass.processW2ATransfer(request);
      print("processResponse${processResponse.toJson()}");
      if (processResponse != null && processResponse.responseCode == "00") {
        Get.off(() => const WalletPaymnetSuccesfullyFailedScreen(), arguments: {
          "success": true,
          "message": "Transaction Successful",
          "transactionReferenceNo": processResponse,
          "amount": processResponse.transactionAmount,
          "paymentId": processResponse.transactionReferenceNo,
          "beneficiary": processResponse.beneficiaryName ?? "",
        });
      } else {
        Get.off(() => const WalletPaymnetSuccesfullyFailedScreen(), arguments: {
          "success": false,
          "message": processResponse?.responseMessage ?? "Transaction Failed!",
           "transactionReferenceNo": processResponse,
          "amount": processResponse.transactionAmount,
          "paymentId": processResponse.transactionReferenceNo,
          "beneficiary": processResponse.beneficiaryName ?? "",
        });
      }
    } catch (e) {
      debugPrint("processW2A error: $e");
      // CustomToast.show("$e");
    }
  }

  Future processW2W(VerifyW2ACredentialsRequest data,
      BeneficiaryData beneficiaryData, String mPin) async {
    try {
      isLoading.value = true;


      RequestSender sender = RequestSender(
        urn: SessionManager().getPayUCustomerUrn(),
     transactionAmount: (double.parse(SessionManager().getValue().toString()) * 100).round().toString(),

        sourceAccountType: "null",
        accountNumber: SessionManager().getBeneficiaryWalletAccNo(),
        reserved1: "O|90020",
        reserved2: "P2P_W2W_O",
        reserved3: "O|90020",
      );

      RequestReceiver receiver = RequestReceiver(
        customerId: "",
        urn:SessionManager().getwalletTranferurn(),
        transactionAmount: (double.parse(SessionManager().getValue().toString()) * 100).round().toString(),
        accountNumber: SessionManager().getwalletTranferAccountNumber(),
        reserved4: "O|90020",
        reserved5: "P2P_W2W_O",
        reserved6: "O|90020",
      );

      List<RequestReceiver> r = [];
      List<RequestSender> s = [];
      s.add(sender);
      r.add(receiver);
      print("s$s");

      CustomerFundTransferRequest request = CustomerFundTransferRequest(
        remark: SessionManager().getMessage(),
        messageCode: "",
        clientTxnId: "",
        requestDateTime: "",
        beneficiaryId: beneficiaryData.beneficiaryId.toString(),
        beneficiaryMobile: beneficiaryData.mobileNumber.toString(),
        mobile: SessionManager().getMobile().toString(),
        feeRate: "0",
        tagName: "tag_name",
        mpin: mPin,
        deviceId: SessionManager().getDeviceId(),
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        requestIp: SessionManager().getDeviceIpAddress().toString(),
        senders: s,
        receivers: r,
        token: SessionManager().getPayUCustomerWalletTransferToken(),
      );

      final processResponse = await repoClass.apiClient.CustomerFundTransfer(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
        request);
         print("🔹 Full Request JSON: ${jsonEncode(request.toJson())}");
    if (processResponse.responseCode == "00") {
       Get.off(() => const WalletPaymnetSuccesfullyFailedScreen(), arguments: {
          "success": true,
          "message": "Transaction Successful",
          "transactionReferenceNo": processResponse,
          "amount": processResponse.transactionAmount,
          "paymentId": processResponse.accosaTransactionId,
          
        });
      } else {
     Get.off(() => const WalletPaymnetSuccesfullyFailedScreen(), arguments: {
          "success": false,
          "message": processResponse.responseMessage ?? "Transaction Failed!",
           "transactionReferenceNo": processResponse,
          "amount": processResponse.transactionAmount,
          "paymentId": processResponse.accosaTransactionId,

        });
      }
    } catch (e) {
      print("Error in W2W transfer: $e");
    
    } finally {
      isLoading.value = false;
    }
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mpinController.clear();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    
    super.onClose();
    if (Get.isRegistered<ConfirmMpinController>()) {
  Get.delete<ConfirmMpinController>();
}
    mpinController.dispose();
  }

}
