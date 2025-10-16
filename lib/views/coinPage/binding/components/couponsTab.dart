import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../custom_widget/no_record_found.dart';
import '../controller/my_coupons_controller.dart';

class CouponScreen extends StatelessWidget {
   CouponScreen({super.key});

     final controller = Get.find<MyCouponPageController>();

  

  @override
  Widget build(BuildContext context) {
      

    return Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: Customloader());
        }

        if (controller.coupons.isEmpty) {
  return Center(
    child: SizedBox(
      height: 180,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: NoRecordFoundWidget(Icons.local_offer, "No Coupons Available", "Check back later for new offers."))),
  );
}

    
   return Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0, horizontal: 10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 cards per row
          childAspectRatio: 1.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: controller.coupons.length,
        itemBuilder: (context, index) {
          final coupon = controller.coupons[index];
          return GestureDetector(
            onTap: (){
              controller.handelSelectionCard(context,coupon,index);
            },
            child: Card(
                 color: Colors.white,
            surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        
                        coupon.offerName!,
                        style: CustomStyles.black13500.copyWith(fontSize: 10.0,color: AppColors.black54),
                        maxLines: 3,overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.bgcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            coupon.coupon_code!,
                            style: CustomStyles.black13500.copyWith(color: AppColors.black54,fontSize: 11.0),
                          ),
                           GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: coupon.coupon_code!));
                    },
                    child: const Icon(Icons.copy, size: 18, color: Colors.grey),
                  ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );});
  
  }
}

