import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';

class NoRecordFoundWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const NoRecordFoundWidget(this.icon, this.title, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 2,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.grey),
                SizedBox(height: 15),
                Text(
                  title,
                  style: CustomStyles.black14500.copyWith(color: AppColors.black54), ),
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    message,
                    style: CustomStyles.grey123,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
