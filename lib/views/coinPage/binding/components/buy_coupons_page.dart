import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../custom_widget/custom_dropdown.dart';
import '../../../../custom_widget/custom_loader.dart';
import '../../../../custom_widget/customstyles.dart';
import '../../../../custom_widget/no_record_found.dart';
import '../../../../model/rewardHostory/get_category_pojo.dart';
import '../controller/buy_coupons_controller.dart';

class BuyCouponsScreen extends StatelessWidget {
  final controller = Get.find<BuyCouponPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            Visibility(
              visible: false,
              child: CustomDropdown<RewardResult>(
                items: controller.dropDownData,
                value: controller.selected.value!,
                onChanged: (val) => controller.handelSelectionChange(val),
                textStyle: CustomStyles.black14400,
                dropdownColor: Colors.grey.shade200,
                borderColor: Colors.grey.shade300,
                itemLabel: (item) => item.categoryName ?? "",
              ),
            ),

            // const SizedBox(height: 15),

            Expanded(
                child: Obx( ()
                  {
                  if (controller.isLoading.value) {
                    return const Center(child: Customloader());
                  } else if (controller.offerList.isEmpty) {
                    return Center(
                      child: SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: NoRecordFoundWidget(
                            Icons.tag_rounded,
                            "No Coupons",
                            "You have no coupons yet.",
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 cards per row
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.6,
                      ),
                      itemCount: controller.offerList.length,
                      itemBuilder: (context, index) {
                        final coupon = controller.offerList[index];
                        return GestureDetector(
                          onTap: () {
                            controller.clickCoupon(context, coupon, index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7.0, vertical: 15.0),
                                    child: (coupon.companyIconImg != null &&
                                            coupon.companyIconImg!.isNotEmpty)
                                        ? Image.network(
                                            coupon.companyIconImg!,
                                            fit: BoxFit.contain,
                                            scale: 1.0,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              width: 50,
                                              height: 50,
                                              color: Colors.transparent,
                                            ),
                                          )
                                        : Container(
                                            width: 50,
                                            height: 50,
                                            color: Colors.transparent,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
