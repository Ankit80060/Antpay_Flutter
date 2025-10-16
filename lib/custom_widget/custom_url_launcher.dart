
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher {

  static Future<void> openUrl(String url) async {
 
    Get.dialog(
      const Center(child: Customloader()),
      barrierDismissible: false,
    );

    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception("Could not launch $url");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    }
  }
}

