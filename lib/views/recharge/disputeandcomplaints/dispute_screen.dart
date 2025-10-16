import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/recharge/components/my_image_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class DisputeScreen extends StatelessWidget {
  const DisputeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildBanner(context),
              const SizedBox(height: 16),
              _buildSectionTitle(),
              _buildActionCard(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Top banner with image + loader
  Widget _buildBanner(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/Dispute%2Fdispute_banr.png?alt=media&token=f75567cd-4f91-4546-a49b-10830fb7db9f",
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(
              child: Customloader(),
            );
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Section title
  Widget _buildSectionTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Raise your Dispute',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Card with action buttons
  Widget _buildActionCard(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(16.0),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            MyImageTextWidget(
              imagePath: 'assets/images/ic_post_complnt.png',
              imageText: 'Post \n Complaint',
              onTap: () {
                Get.toNamed(RoutesName.postcomplaint);
              },
            ),
            const SizedBox(width: 16),
            MyImageTextWidget(
                imagePath: 'assets/images/ic_check_complnt.png',
                imageText: 'Check Complaint \n Status',
                onTap: () {
                  Get.toNamed(RoutesName.complaintstatusscreen);
                }
                // Navigator.pushNamed(context, RoutesName.check_complaint_status),
                ),
          ],
        ),
      ),
    );
  }
}
