import 'package:antpay_lite/model/billpay/FetchBillBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../custom_widget/customstyles.dart';
import '../../model/billpay/bill_pay_request.dart';
import '../../model/recharge_model/recharge_payu_model.dart';
import '../../model/recharge_model/recharge_status_check.dart';
import '../../prefrences/session_manager.dart';
import '../../repository/billpay_repository/billpay_repo.dart';
import '../../utils/app_constant.dart';
import '../../utils/routes/routes_name.dart';

class PostPaidTableController extends GetxController {
  BillPayRepo repository = BillPayRepo();

  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  int getTransactionStatusCount = 0;

  var billerInfoData = Rx<AddInfo?>(null);

  TextEditingController customAmountController = TextEditingController();

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

      if (Get.arguments['fromPage'] == "FromPostPay") {
        Future.delayed(const Duration(seconds: 2), () {
          print("tttttttttttttttttttt ${billerInfoData.value!.bill_number}");

              print("tttttttttttttttttttt ${SessionManager().getMobile()}");
          // callBillPaySucessApi();
        });
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<PostPaidTableController>()) {
      Get.delete<PostPaidTableController>();
    }
    customAmountController.dispose();
  }

  String? getServiceType() {
    return SessionManager().getServiceType();
  }

  void getBillerData() {
    billerInfoData.value = SessionManager().getPostPaidDetailsData();
    customAmountController.text = billerInfoData.value!.bill_amount.toString();
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

    if (amount < 10) {
      CustomToast.show("Please Enter At Least 10 Rs");
      return false;
    }

    return true;
  }

  Future<void> callBillPaySucessApi() async {
    showLoaderPopup(Get.context!);
    isLoading.value = true;
    try {
      Map orderdata = SessionManager().getGenerateOrderResponse();
      RechargePayUPaymentReq data = RechargePayUPaymentReq(
          //paymentMethod: orderdata[SessionManager.SERVICE],
          aParam: AppConstant.generateAuthParam(
              SessionManager().getMobile().toString()),
          antTxnId: orderdata[SessionManager.AMOUNT_TRANSCATION_ID],
          circlecode: SessionManager().getValue(),
          operatorcode: SessionManager().getOperatorCode(),
          amount: orderdata[SessionManager.INVESTMENT_AMOUNT],
          servicetype: orderdata[SessionManager.SERVICE],
          transactionType: "Spend",
          paymentMethod: orderdata[SessionManager.PGTYPE],
          number: billerInfoData.value!.bill_number,
          customermobile:  SessionManager().getMobile(),
          transactionResult: SessionManager().getTranscationResult(),
          payuResponse: SessionManager().getPayUResponse());

      RechargePayUPaymentRes response =
          await repository.callPaymentSuccessRechargePay(
              AuthToken.getAuthToken(),
              SessionManager().getToken().toString(),
              data);

      if (response.status.toString() == '1') {
        Get.toNamed(RoutesName.rechargeSuccess,arguments: null);
        //sent to success screen
      } else  {
        callCheckRechargeStatusApi();
     
        // CustomToast.show(response.responseMessage ?? "");
       
      }
    } catch (e) {
      Get.toNamed(RoutesName.rechargeFail, arguments: null);
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> callCheckRechargeStatusApi() async {
    isLoading.value = true;
    try {
      Map orderdata = SessionManager().getGenerateOrderResponse();
      RechargeStatusReq data = RechargeStatusReq(
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        // mobile: SessionManager().getMobile(),
        utransactionid: orderdata[SessionManager.AMOUNT_TRANSCATION_ID],
      );
      RechargeStatusRes response = await repository.callCheckRechargeStatusApi(
          AuthToken.getAuthToken(),
          SessionManager().getToken().toString(),
          data);

      if (response.status.toString() == '1') {
        Get.toNamed(RoutesName.rechargeSuccess,arguments: null);
      } else if (response.status.toString() == "0" ||
          response.status.toString() == "2") {
        if (getTransactionStatusCount < 10) {
          getTransactionStatusCount++;
          Future.delayed(const Duration(seconds: 2), () {
            callCheckRechargeStatusApi();
          });
        } else {
          getTransactionStatusCount = 0;
          CustomToast.show(response.responseMessage ?? "");
          Get.toNamed(RoutesName.pendingOrderScreen, arguments: null);
        }
      } else {
         getTransactionStatusCount = 0;
        CustomToast.show(response.responseMessage ?? "");
        Get.toNamed(RoutesName.rechargeFail, arguments: null);
      }
     
      
    } catch (e) {
       getTransactionStatusCount = 0;
      CustomToast.show(e.toString());
       Get.toNamed(RoutesName.rechargeFail, arguments: null);
    } finally {
      isLoading.value = false;
    }
  }


    void showLoaderPopup(BuildContext context) {
  Get.dialog(
        barrierDismissible: false,
        Align(
          alignment: Alignment.center,
          child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/loader_image.gif',
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Please wait...',
                        style: CustomStyles.black12400,
                      ),
                    ],
                  ),
                ),
              )),
        ));

}
}
