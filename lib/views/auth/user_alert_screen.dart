import 'dart:io';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/routes/routes_name.dart';

class UserAlertScreen extends StatelessWidget {
  const UserAlertScreen({super.key});

  Widget _buildDialogContent(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
        return false;
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title and Icon Row
              Row(
                children: [
                   Text(
                    'Alert',
                    style: CustomStyles.black15600
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/warning_icon.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade300),
         

               Text(
                "For security reasons, we suggest you to use pin or password for using wallet.",
                style:CustomStyles.grey125,textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              /// Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.login, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffc5e6eb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Continue anyway',
                    style:CustomStyles.black12300
                  ),
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show dialog after the screen is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (_) => _buildDialogContent(context),
      );
    });

    // Base white screen
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        // Expands to the full screen to ensure everything fits
        child: Container(
          color:
              Colors.white, // Ensure the background behind the dialog is white
        ),
      ),
    );
  }
}
