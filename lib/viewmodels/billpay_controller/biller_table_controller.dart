import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/billpay/bill_pay_request.dart';
import '../../model/billpay/loan_repayment_biller_model.dart';
import '../../prefrences/session_manager.dart';
import '../../repository/billpay_repository/billpay_repo.dart';
import '../../utils/app_constant.dart';
import '../../utils/routes/routes_name.dart';

class BillerTableController extends GetxController {
  BillPayRepo repository = BillPayRepo();

  RxBool isLoading = false.obs;

  var billerRetriveData = Rx<LoanBillerResponse?>(null);

  final TextEditingController customAmountController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBillerData();

  
  }

   @override
  void onReady() {
    super.onReady();


    if (Get.arguments != null) {

      if (Get.arguments['fromPage'] == "FromBillPay") {
        Future.delayed(const Duration(seconds: 2), () {
          callBillPaySucessApi();
        });
      }
    }
  }



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<BillerTableController>()) {
      Get.delete<BillerTableController>();
    }
    customAmountController.dispose();
  }

  String? getServiceType() {
    return SessionManager().getServiceType();
  }

  void getBillerData() {
    billerRetriveData.value =
        SessionManager().getBillerDetailsData()!.billerResponse;
    customAmountController.text =
        billerRetriveData.value!.billAmount.toString();

    // var  billerDetails = SessionManager().getBillerDetailsData();
        
//  Map<String, dynamic> billResultData = {
//         "responseCode": billerDetails?.responseCode,
//         "inputParams": billerDetails?.inputParams,
//         "billerResponse": billerDetails?.billerResponse!.toJson(),
//       };

//         print("dfghjkkkkkkkkkkkkkkk $billResultData");
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

  Future<void> callBillPaySucessApi() async {
    isLoading.value = true;
    Map orderdata = SessionManager().getGenerateOrderResponse();
    try {

    var  billerDetails = SessionManager().getBillerDetailsData();

      Map<String, dynamic> billResultData = {
        "responseCode": billerDetails?.responseCode,
        "inputParams": billerDetails?.inputParams,
        "billerResponse": billerDetails?.billerResponse!.toJson(),
      };
      BillPayRequest data = BillPayRequest(
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        antTxnId:orderdata[SessionManager.AMOUNT_TRANSCATION_ID],
        amount: orderdata[SessionManager.INVESTMENT_AMOUNT],
        payuResponse: SessionManager().getPayUResponse().toString(),
        mobile: SessionManager().getMobile(),
        requestId: SessionManager().getBillerRequestId(),
        billerCategory: SessionManager().getServiceType(),
        billerId: SessionManager().getBillerId(),
        billResult: billResultData,
        email:  SessionManager().getUserEmail()
      );

      BillPayResponse response = await repository.callPaymentSuccessBillPay(
          AuthToken.getAuthToken(),
          SessionManager().getToken().toString(),

          data);

      if (response.status.toString() == '1') {
        if (response.response!.responseCode.toString()=="000") {
        Get.toNamed(RoutesName.rechargeSuccess,arguments: null);
          
        }else{
           Get.toNamed(RoutesName.rechargeFail,arguments: null);
          CustomToast.show(response.response!.responseCode.toString());
        }

      } else {
        Get.toNamed(RoutesName.rechargeFail,arguments: null);
        // CustomToast.show(response.msg.toString());
      }
    } catch (e) {
       Get.toNamed(RoutesName.rechargeFail,arguments: null);
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clickPayBtn() {
    final input = customAmountController.text;


    if (isValidCustomAmount(input)) {
      Get.toNamed(
        RoutesName.addMoney,
        arguments: {
          "isaddmoney": false,
          "amount": input,
          "fromPage": "bill-and-recharge",
        },
      );
    }
  }
   
}
