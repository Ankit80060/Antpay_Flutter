
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/views/cardOffer/components/discount_offer_components.dart';
import 'package:antpay_lite/views/cardOffer/controller/card_offer_controler.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_appbar.dart';
import '../../custom_widget/custom_dropdown.dart';
import '../../custom_widget/custom_loader.dart';
import '../../res/color_palette.dart';

class CardOfferViewPage extends StatelessWidget {
  CardOfferViewPage({Key? key}) : super(key: key);

  final CardOfferViewPageController controller =
      Get.put(CardOfferViewPageController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: controller.images.map((url) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      controller.currentIndex.value = index;
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.images.map((url) {
                        int index = controller.images.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.currentIndex.value == index
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    )),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Obx(() {
return
                    _balanceCard(
                      title: "Mini A/c Balance",
                      text:controller.availableBalance.value
                    );
                    }),
                    SizedBox(
                      width: 12,
                    ),
                    Obx(() =>
                    _balanceCard(
                      title: "AntPay Coins Balance",
                      text: controller.coinsBalance.value,
                      icon: Image.asset(
                        'assets/images/coins.png',
                        scale: 3.0,
                      ),
                      forwardIcon: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.black,
                      ),
                    ),
                    ),
                  ],
                ),
SizedBox(
                  height: 10.0,
                ),

                Obx(
                  () => CustomDropdownWithoutUnderLine(
                    from:"offerBanner",
                    items: controller.dropDownData,
                    hintText: "Select Category",
                    value: controller.selectedDropDownId.value ?? null,
                    onChanged: (val) => controller.handelSelectionChange(val),
                    textStyle: CustomStyles.black14400,
                    dropdownColor: Colors.white,
                    borderColor: Colors.grey.shade300,
                    labelText: " Browse by category",
                  ),
                ),
                SizedBox(
                  height: 17.0,
                ),

                Text('Discount Offers', style: CustomStyles.black14500),
                 SizedBox(
                  height: 15.0,
                ),
                 DiscountOffersCard(controller:controller),
              ],
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? Container(
                    color: Colors.black.withOpacity(0.03),
                    child: const Center(
                      child: Customloader(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ]),
      ),
    );
  }

  Widget _balanceCard({
    required String title,
    required String text,
    Image? icon,
    Icon? forwardIcon,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (title == "AntPay Coins Balance") {
          controller.handelCardClick();
            return;
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          // elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          color: Colors.white,
          surfaceTintColor: Colors.transparent, 
          elevation: 2,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomStyles.grey103
                      .copyWith(color: AppColors.black54, fontSize: 11.0),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    if (icon != null) ...[
                      icon,
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Text(
                     icon != null? text :"₹ $text" ,
                        style: CustomStyles.black16600,
                      ),
                    ),
                    if (forwardIcon != null) ...[
                      forwardIcon,
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
