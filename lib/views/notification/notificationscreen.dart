import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/notificationcontroller/notification_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController controller = Get.put(
    NotificationController(),
  );

  @override
  Widget build(BuildContext context) {
    controller.fetchNotifications();

    return MainScaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: Customloader());
        }

        if (controller.notifications.isEmpty) {
          return const Center(
            child: Text(
              "No Notifications Found",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.notifications.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = controller.notifications[index];
            return GestureDetector(
              onTap: () {
                //  Prefer navigation by pageName
                if (item.pageName != null && item.pageName!.isNotEmpty) {
                  controller.navigateToPage(item.pageName);
                } else if (item.pageUrl != null) {
                  // fallback: open external URL
                  CustomUrlLauncher.openUrl(item.pageUrl.toString());
                }
              },
              child: Card(
                elevation: 2,
                surfaceTintColor: Colors.white,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Image
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: item.imgUrl ?? item.img.toString(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey.shade300,
                              alignment: Alignment.center,
                              child: const Icon(Icons.broken_image,
                                  color: Colors.grey, size: 40),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title ?? "",
                              style: CustomStyles.black12600,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.createdDate ?? "",
                                    style: CustomStyles.black10400,
                                  ),
                                ),
                              ],
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
        );
      }),
    );
  }
}
