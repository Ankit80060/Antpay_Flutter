import 'dart:async';

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
  Timer? _timer;
  bool isBellClicked = false;

  @override
  void initState() {
    super.initState();
    // Fetch notifications immediately
    controller.fetchNotifications().then((_) {
      // Show active bell if notifications exist on app start
      if (controller.notifications.isNotEmpty) {
        setState(() {
          isBellClicked = false; // show active bell with red dot
        });
      }
    });
    // Start periodic timer
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      await controller.fetchNotifications();
      // If new notifications arrive after bell was clicked, show active bell again
      if (controller.notifications.isNotEmpty && isBellClicked) {
        setState(() {
          isBellClicked = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final notificationCount = controller.notifications.length;

      String bellIcon;
      if (notificationCount > 0) {
        bellIcon = isBellClicked
            ? 'assets/images/notification_bell.png' // inactive after clicked
            : 'assets/images/notificationbell31.png'; // active (new notifications)
      } else {
        bellIcon = 'assets/images/notification_bell.png'; // no notifications
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
                isBellClicked = true; // user clicked bell
              });
              Get.toNamed(RoutesName.notificationscreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(bellIcon, scale: 4),
                  // Show red dot if there are unread notifications and bell not clicked
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
