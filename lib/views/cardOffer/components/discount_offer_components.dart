import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widget/no_record_found.dart';
import '../controller/card_offer_controler.dart';

class DiscountOffersCard extends StatelessWidget {
  final CardOfferViewPageController controller;

  const DiscountOffersCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.offersCategoryList.isEmpty) {
        return SizedBox(
          height: 180,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: NoRecordFoundWidget(
              Icons.hourglass_empty_outlined,
              "No Discount",
              "Discount offer is not available",
            ),
          ),
        );
      }

      return GridView.builder(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(), 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.6,
        ),
        itemCount: controller.offersCategoryList.length,
        itemBuilder: (context, index) {
          final coupon = controller.offersCategoryList[index];
          return GestureDetector(
            onTap: () => controller.clickCoupon(context, coupon, index),
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
                              errorBuilder: (context, error, stackTrace) =>
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
    });
  }
}
