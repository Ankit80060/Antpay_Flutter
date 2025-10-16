import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customstyles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showBackIcon;

  const CustomAppbar({
    super.key,
    this.showBackIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomStyles.bgcolor,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.black87,
      automaticallyImplyLeading: false,
      leading: showBackIcon == true
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
            Get.toNamed(RoutesName.notificationscreen);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/notification_bell.png',
              scale: 4,
            ),
          ),
        ),
      ],
    );
  }
}
