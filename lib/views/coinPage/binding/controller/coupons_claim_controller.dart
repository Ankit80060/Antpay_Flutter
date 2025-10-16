import 'package:antpay_lite/views/coinPage/binding/controller/buy_coupons_controller.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/coin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/auth_token.dart';
import '../../../../custom_widget/custom_toast_msg.dart';
import '../../../../prefrences/session_manager.dart';
import '../../../../repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import '../../../../utils/app_constant.dart';

class CouponsClaimController extends GetxController {
  MiniAccountRepo repository = MiniAccountRepo();
  RxBool isClaimSuccess = false.obs;

  final buyCouponcontroller = Get.find<BuyCouponPageController>();
  final coinPageController = Get.find<CoinPageController>();
  final TextEditingController pinController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString imgUrl = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    imgUrl.value = buyCouponcontroller.couponsData.value?.companyIconImg ?? "";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<CouponsClaimController>()) {
      Get.delete<CouponsClaimController>();
    }
    isClaimSuccess.value = false;
    pinController.clear();
  }

  void clickClaimCoupon() async {
    if (pinController.text.length < 6) {
      CustomToast.show('Please enter a 6-digit PIN');
      return;
    }

    try {
      isLoading.value = true;
      var data = {
        // "mobile": '8006034041',
        "mobile": SessionManager().getMobile().toString(),
        "source": "Antpay", "Mpin": pinController.text,
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      };

      final response = await repository.callClaimCouponsApi(
        AuthToken.getAuthToken(),
        SessionManager().getToken().toString(),
        request: data,
      );
      if (response.status.toString() == '1') {
        isClaimSuccess.value = true;
      } else {
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  void callShowCouponAPi() async{

    try {
      isLoading.value = true;
      var data ={
        "mobile":
        // '8006034041',
         SessionManager().getMobile().toString(),
         "source":"Antpay", "Mpin":pinController.text,
         "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
       
      };


      // final response = await repository.callClaimCouponsApi(
      //     AuthToken.getAuthToken(),

      //    SessionManager().getToken().toString(),
          
      //   request: data,
      // );
      // if (response['status'].toString() == '1') {
      //   isClaimSuccess.value = true;
      // } else {
      //    CustomToast.show(response['msg'].toString());
      
      // }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }

  }

  void closeClaimCoupon() {
    coinPageController.closeClaimCouponPage();
  }
}
