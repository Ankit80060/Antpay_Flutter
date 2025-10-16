import 'dart:io';

import 'package:antpay_lite/repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../custom_widget/custom_toast_msg.dart';
import '../../../../custom_widget/custom_url_launcher.dart';
import '../../../../custom_widget/customstyles.dart';
import '../../../../model/rewardHostory/coupon_resmodel.dart';
import '../../../../prefrences/session_manager.dart';

class MyCouponPageController extends GetxController {
  MiniAccountRepo _repository2 = MiniAccountRepo();

  RxBool isLoading = false.obs;
  RxList<OfferModel> coupons = <OfferModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getMyCouponsData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<MyCouponPageController>()) {
      Get.delete<MyCouponPageController>();
    }
  }

  void handelSelectionCard(context, OfferModel coupon, int index) {
    Get.dialog(
      Align(
          alignment: Alignment.center,
          child: Material(
            borderRadius: BorderRadius.circular(10),
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
                    Text(
                      coupon.offerName!,
                      style: CustomStyles.black12400.copyWith(fontSize: 11.0),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.bgcolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                coupon.coupon_code!,
                                style: CustomStyles.black13500.copyWith(
                                  color: AppColors.black54,
                                  fontSize: 11.0,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: coupon.coupon_code!));
                                },
                                child: const Icon(Icons.copy,
                                    size: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgcolor,
                        foregroundColor: AppColors.bgcolor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 10),
                      ),
                      onPressed: coupon.offerUrl!.isNotEmpty
                          ? () {
                              CustomUrlLauncher.openUrl(coupon.offerUrl!);
                            }
                          : null,
                      child: Text(
                        "Shop Now",
                        style: CustomStyles.black13500.copyWith(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  String getOS() {
    if (kIsWeb) return "Web";
    if (Platform.isAndroid) return "ANDROID";
    if (Platform.isIOS) return "IOS";
    if (Platform.isWindows) return "Windows";
    if (Platform.isLinux) return "Linux";
    if (Platform.isMacOS) return "macOS";
    return "Unknown";
  }

  Future<void> getMyCouponsData() async {
    try {
      isLoading.value = true;
      var data = {
        "mobile":
            // "8006034041",
            SessionManager().getMobile(),
        "source": getOS()
      };

      final response = await _repository2.fetchCouponsData(
        request: data,
      );
      if (response.status.toString() == '1') {
        coupons.assignAll(response.offerList);
      } else {
        coupons.clear();
        //  CustomToast.show(response.msg.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
