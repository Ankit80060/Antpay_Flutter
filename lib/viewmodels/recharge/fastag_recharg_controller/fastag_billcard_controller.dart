import 'package:antpay_lite/model/billpay/BBPSGetBillerBean.dart';
import 'package:antpay_lite/model/billpay/FastageModelbillavenue.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth_token.dart';
import '../../../custom_widget/custom_toast_msg.dart';
import '../../../model/billpay/bill_pay_request.dart';
import '../../../repository/billpay_repository/billpay_repo.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/routes/routes_name.dart';

class FastagBillCardController extends GetxController {
  BillPayRepo repository = BillPayRepo();
  // Loader
  var isLoading = false.obs;

  // Data
  var billerRetriveData = Rx<GetBillerResponse?>(null);
  final TextEditingController amountController = TextEditingController();

  @override
  void onInit() {
    super.onInit();


    getBillerData();
    
  }

  @override
  void onReady() {
    super.onReady();


    if (Get.arguments != null) {
      if (Get.arguments['fromPage'] == "FromFastTagRecharge" ||
          Get.arguments['fromPage'] == "FromNCMCRecharge") {
        Future.delayed(const Duration(seconds: 2), () {
          callBillPaySucessApi();
        });
      }
    }
  }

  void getBillerData() {
    billerRetriveData.value =
        SessionManager().getFastBillerDetailsData()!.billerResponse;
    amountController.text = billerRetriveData.value!.billAmount.toString();
  }

  @override
  void onClose() {
    if (Get.isRegistered<FastagBillCardController>()) {
      Get.delete<FastagBillCardController>();
    }

    super.onClose();
  }

  // Default service type

  String? getServiceType() {
    return SessionManager().getServiceType();
  }

  Future<void> callBillPaySucessApi() async {
    isLoading.value = true;
    Map orderdata = SessionManager().getGenerateOrderResponse();

    var  billerDetails = SessionManager().getFastBillerDetailsData();

      Map<String, dynamic> billResultData = {
        "responseCode": billerDetails?.responseCode,
        "inputParams": billerDetails?.inputParams,
        "billerResponse": billerDetails?.billerResponse!.toJson(),
        "additionalInfo": billerDetails?.additionalInfo?.toJson(),
      };
    try {
      BillPayRequest data = BillPayRequest(
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          antTxnId:orderdata[SessionManager.AMOUNT_TRANSCATION_ID],
          amount: orderdata[SessionManager.INVESTMENT_AMOUNT],
          payuResponse: SessionManager().getPayUResponse(),
          mobile: SessionManager().getMobile(),
          requestId: SessionManager().getBillerRequestId(),
          billerCategory: SessionManager().getServiceType(),
          billerId: SessionManager().getBillerId(),
          billResult: billResultData,
          email: SessionManager().getUserEmail());

      BillPayResponse response = await repository.callPaymentSuccessBillPay(
          AuthToken.getAuthToken(),
          SessionManager().getToken().toString(),
          data);

      if (response.status.toString() == '1') {
        if (response.response!.responseCode.toString() == "000") {
          Get.toNamed(RoutesName.rechargeSuccess,arguments: null);
        } else {
          Get.toNamed(RoutesName.rechargeFail,arguments: null);
          CustomToast.show(response.response!.toJson()["errorInfo"]["error"]["errorMessage"]);
        }

        //sent to success screen
      } else {
        Get.toNamed(RoutesName.rechargeFail,arguments: null);
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool isValidCustomAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      CustomToast.show("Please enter an amount");
      return false;
    }

    final amount = double.tryParse(value);
    if (amount == null) {
      CustomToast.show("Please enter a valid number");
      return false;
    }

    if (amount < 1) {
      CustomToast.show("Please Enter At Least 1 Rs");
      return false;
    }

    return true;
  }

  void clickPayBtn() {
    final input = amountController.text;

    if (isValidCustomAmount(input)) {
      Get.toNamed(RoutesName.addMoney, arguments: {
        "isaddmoney": false,
        "fromPage": "fastage",
        "amount": input
      });
    }
  }
}
