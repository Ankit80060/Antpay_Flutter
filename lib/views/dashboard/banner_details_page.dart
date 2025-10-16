import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../custom_widget/custom_appbar.dart';
import '../../MainScaffold.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../res/color_palette.dart';
import '../../viewmodels/dashboard_controller/banner_view_controller.dart';

class BannerViewScreen extends StatelessWidget {
  BannerViewScreen({Key? key}) : super(key: key);
  final controller = Get.put(BannerViewContoller());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
         body: SafeArea(
            child: Stack(children: [
          SingleChildScrollView(
            child: Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            controller.offersDetailsList.value.offerBannerImg ??
                                "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.grey.shade300,
                              alignment: Alignment.center,
                              child: const Icon(Icons.broken_image,
                                  size: 60, color: Colors.grey),
                            ),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        controller.offersDetailsList.value.offerName ?? "",
                        style: CustomStyles.black20500.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        controller.offersDetailsList.value.termCondition ?? "",
                        style: CustomStyles.black12400
                            .copyWith(color: AppColors.black54),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: DottedBorder(
                              // color: AppColors.black54,
                              // strokeWidth: 1,
                              // dashPattern: [6, 3],
                              // borderType: BorderType.RRect,
                              // radius: const Radius.circular(8),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text(
                                      "COUPON CODE",
                                      style: CustomStyles.black13500,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      controller.couponIds.value ?? "",
                                      style: CustomStyles.black12400
                                          .copyWith(color: AppColors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 100,
                            child: CustomElevatedButton(
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: "couponCode"));
                              },
                              text: "COPY",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: CustomElevatedButton(
                          onPressed: () {
                            if (controller.offersDetailsList.value.offerUrl ==
                                    null ||
                                controller.offersDetailsList.value.offerUrl!
                                    .isEmpty) {
                              CustomToast.show("No URL found");
                              return;
                            }
                            CustomUrlLauncher.openUrl(
                                controller.offersDetailsList.value.offerUrl ??
                                    "");

                            // TODO: handle navigation to shopUrl
                          },
                          text: "SHOP NOW",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )),
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
        ])));
  }
}
