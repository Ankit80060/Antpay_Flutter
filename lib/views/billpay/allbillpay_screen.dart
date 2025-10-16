import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/customstyles.dart';
import '../../res/color_palette.dart';
import '../../viewmodels/billpay_controller/bill_pay_controller.dart';

class AllBillPay extends StatelessWidget {
  AllBillPay({Key? key}) : super(key: key);
  final billPayController = Get.put(BillPayController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
     
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner image
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: ColorPalette.white,
                    surfaceTintColor: ColorPalette.white,
                    elevation: 2,
                    child: SizedBox(
                      height: 200.0,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://antworksmoney.com/apiserver/assets/img/billPay.png",
                        placeholder: (context, url) => Center(
                          child: Image.asset(
                            'assets/images/loader_image.gif',
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Wallet and Coins balance cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Obx(() {
                        return _balanceCard(
                            title: "Mini A/c Balance",
                            text: billPayController.walletBalance.value);
                      }),
                      SizedBox(
                        width: 12,
                      ),
                      Obx(
                        () => _balanceCard(
                          title: "AntPay Coins Balance",
                          text: billPayController.coinsBalance.value,
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
                ),
                const SizedBox(height: 20),
                Obx(() {
                  if (billPayController.categoryList.isEmpty) {
                    return const SizedBox.shrink();
                  } else if (billPayController.categoryList.isEmpty) {
                    return Center(
                      child: Text(
                        'No categories available',
                        style: CustomStyles.black12400
                            .copyWith(color: AppColors.black54),
                      ),
                    );
                  } else
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Bill Pay',
                                      style: CustomStyles.black18600,
                                    ),
                                    Text(
                                      'What do you want to pay today?',
                                      style: CustomStyles.black12400,
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    billPayController.categoryList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 35,
                                  childAspectRatio: 1,
                                ),
                                itemBuilder: (context, index) {
                                  final category =
                                      billPayController.categoryList[index];
                                  return GestureDetector(
                                    onTap: () async {
                                      billPayController.handleCategoryTap(
                                        category.Service_Name,
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: CachedNetworkImage(
                                            imageUrl: category
                                                    .service_categories_img_new ??
                                                category
                                                    .service_categories_img ??
                                                "https://antworksmoney.com/apiserver/assets/img/billPay.png",
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          height: 40,
                                          child: Text(
                                            category.Service_Name ?? '',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomStyles.black12300
                                                .copyWith(fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                })
              ],
            ),
          ),
          Obx(
            () => billPayController.isLoading.value
                ? Container(
                    color: Colors.black.withOpacity(0.03),
                    child: const Center(
                      child: Customloader(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
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
            billPayController.handelCardClick();
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
                        icon != null ? text : "₹ $text",
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
