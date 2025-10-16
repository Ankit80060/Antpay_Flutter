import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/views/coinPage/binding/components/buy_coupons_page.dart';
import 'package:antpay_lite/views/coinPage/binding/components/coins_history.dart';
import 'package:antpay_lite/views/coinPage/binding/components/couponsTab.dart';
import 'package:antpay_lite/views/coinPage/binding/components/coupons_claim.dart';
import 'package:antpay_lite/views/coinPage/binding/components/gift_coins_page.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/buy_coupons_controller.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/coin_history_controller.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/coin_page_controller.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/coupons_claim_controller.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/gift_coins_controller.dart';
import 'package:antpay_lite/views/coinPage/binding/controller/my_coupons_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';
import '../../../custom_widget/custom_appbar.dart';
import '../../../res/color_palette.dart';

class CoinTabPage extends StatelessWidget {
  CoinTabPage({Key? key}) : super(key: key);
  final controller = Get.find<CoinPageController>();
  final buyCouponcontroller = Get.find<BuyCouponPageController>();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Obx(() => Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.bgcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children:
                        List.generate(controller.tabsData.length, (index) {
                      final isSelected =
                          controller.selectedIndex.value == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => controller.handelTabSelection(index),
                          child: AnimatedContainer(
                            // height: double.infinity, 
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.red : AppColors.bgcolor,
                              borderRadius: (index == 0)
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    )
                                  : (index == 3)
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        )
                                      : BorderRadius.zero,
                            ),
                            child: Center(
                              child: Text(
                                controller.tabsData[index],
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomStyles.black13500.copyWith(
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.black54,
                                    fontSize: 12.0),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )),

            // SizedBox(height: 20.0,),
            Expanded(
              child: Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return GetBuilder<MyCouponPageController>(
                      init: MyCouponPageController(),
                      builder: (_) => CouponScreen(),
                    );
                  // return CouponScreen();
                  case 1:
                    return GetBuilder<CoinHistoryPageController>(
                      init: CoinHistoryPageController(),
                      builder: (_) => CoinsHistoryTable(),
                    );
                  // return CoinsHistoryTable();
                  case 2:
                    return buyCouponcontroller.couponsData.value != null
                        ? GetBuilder<CouponsClaimController>(
                            init: CouponsClaimController(),
                            builder: (_) => CouponsClaimPage(),
                          )
                        : GetBuilder<BuyCouponPageController>(
                            init: BuyCouponPageController(),
                            builder: (_) => BuyCouponsScreen(),
                          );
                  // buyCouponcontroller.couponsData!=null? CouponsClaimPage():

                  // return  buyCouponcontroller.couponsData.isNotEmpty? CouponsClaimPage():BuyCouponsScreen();

                  case 3:
                    return GetBuilder<GiftCoinsPageController>(
                      init: GiftCoinsPageController(),
                      builder: (_) => GiftCoinsScreen(),
                    );
                  // return GiftCoinsScreen();
                  default:
                    return GetBuilder<MyCouponPageController>(
                      init: MyCouponPageController(),
                      builder: (_) => CouponScreen(),
                    );
                }
              }),
            ),
          ]),
        ));
  }
}
