import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/notificationcontroller/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customstyles.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final bool? showBackIcon;

  const CustomAppbar({super.key, this.showBackIcon});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  final NotificationController controller = Get.put(NotificationController());
  bool isBellClicked = false;

  @override
  void initState() {
    super.initState();

    // Fetch notifications once when app bar is initialized
    controller.fetchNotifications().then((_) {
      if (controller.notifications.isNotEmpty) {
        setState(() {
          isBellClicked = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final notificationCount = controller.notifications.length;

      String bellIcon;
      if (notificationCount > 0) {
        bellIcon = isBellClicked
            ? 'assets/images/notification_bell.png'
            : 'assets/images/notificationbell31.png';
      } else {
        bellIcon = 'assets/images/notification_bell.png';
      }

      return AppBar(
        backgroundColor: CustomStyles.bgcolor,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        leading: widget.showBackIcon == true
            ? IconButton(
                icon: const Icon(CupertinoIcons.back),
                color: Colors.black87,
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Image.asset(
          'assets/images/antpay_logo.png',
          scale: 1.5,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isBellClicked = true;
              });
              Get.toNamed(RoutesName.notificationscreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(bellIcon, scale: 4),
                  if (notificationCount > 0 && !isBellClicked)
                    Positioned(
                      right: 2,
                      top: 2,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
