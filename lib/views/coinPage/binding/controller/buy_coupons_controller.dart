import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/auth_token.dart';
import '../../../../custom_widget/custom_toast_msg.dart';
import '../../../../model/rewardHostory/get_category_pojo.dart';
import '../../../../prefrences/session_manager.dart';
import '../../../../repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import '../../../../utils/app_constant.dart';

class BuyCouponPageController extends GetxController {
  MiniAccountRepo _repository2 = MiniAccountRepo();
  RxBool isLoading = false.obs;

  // RxString selected = "".obs;
  // Rx<RewardResult> selected = RewardResult().obs;
  var selected = Rx<RewardResult?>(null);

  RxList<RewardResult> dropDownData = <RewardResult>[].obs;
  RxList<rewardOfferModel> offerList = <rewardOfferModel>[].obs;

  // final List<String> dropDownData = [
  //   'All',
  //   "Online",
  //   "Education",
  //   'Travel',
  //   'Gifting',
  // ].obs;

  var couponsData = Rx<rewardOfferModel?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoriesDropdown();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    couponsData.value = null;
    if (Get.isRegistered<BuyCouponPageController>()) {
      Get.delete<BuyCouponPageController>();
    }
  }

  void handelSelectionChange(val) {
    selected.value = val;
    getCouponOfferByCategory(
        selected.value!.id!, selected.value!.categoryName!);
  }

  void clickCoupon(BuildContext context, rewardOfferModel coupon, int index) {
    couponsData.value = coupon;
  }

  void emptyCouponsData() {
     couponsData.value = null;
  }

  Future<void> getCategoriesDropdown() async {
    try {
      isLoading.value = true;

      final response = await _repository2.getCategoriesDetails(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
      );
      if (response.status.toString() == '1') {
        dropDownData.assignAll(response.result);

        // set default selection (first element OR match id = "25")
        selected.value = dropDownData.firstWhere(
          (e) => e.id == "25",
          orElse: () => dropDownData.first,
        );
        getCouponOfferByCategory(
            selected.value!.id!, selected.value!.categoryName!);
      } else {
        dropDownData.clear();
        CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCouponOfferByCategory(id, categeryName) async {
    try {
      isLoading.value = true;

      var data = {
        "aParam": AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        "mobile": SessionManager().getMobile().toString(),
        "offer_type": categeryName,
        "category_id": id,
      };

      final response = await _repository2.getCouponOfferByCategory(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
          data);
      if (response.status.toString() == '1') {
        offerList.assignAll(response.offerModels);
      } else {
        isLoading.value = false;
        offerList.clear();
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  
}
