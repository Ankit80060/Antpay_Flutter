import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomToast {
  static void show(String message) {
    final overlay = Overlay.of(Get.overlayContext!);
    final overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 10,
        left: 24,
        right: 24,
        child: Material(
          color: Colors.transparent,
          child: ToastWidget(message: message),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2))
        .then((_) => overlayEntry.remove());
  }
}

class ToastWidget extends StatelessWidget {
  final String message;

  const ToastWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/toast_logo.png",
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  message,
                  style: CustomStyles.white14500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
