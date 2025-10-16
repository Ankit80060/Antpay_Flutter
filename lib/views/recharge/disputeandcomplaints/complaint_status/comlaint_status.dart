import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/viewmodels/recharge/disputecontroller/Complaintstatus/complaint_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../MainScaffold.dart';
import '../../../../custom_widget/custom_textfield.dart';

class ComplaintStatusScreen extends StatelessWidget {
  final ComplaintStatusController controller =
      Get.put(ComplaintStatusController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          final statusData = controller.complainStatus.value;

          final showInputCard = statusData == null || statusData.status == 0;
          final showResponseCard = statusData != null && statusData.status == 1;

          if (statusData != null && statusData.status == 0) {
            Future.microtask(() {
              CustomToast.show("Please enter the correct Complaint ID");
            });
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showInputCard)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Check Complaint Status",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.complaintIdController,
                          hintText: "Enter Complaint ID",
                          labelText: 'Complaint ID',
                          onChanged: (val) => controller.complainId.value = val,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a Complaint ID";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: controller.isLoading.value
                              ? const Center(child: Customloader())
                              : CustomElevatedButton(
                                  text: "Proceed",
                                  onPressed: () async {
                                    await controller.submitComplaint();
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (showResponseCard)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Complaint Status",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Complaint ID: ${statusData.complainId ?? 'N/A'}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Date: ${statusData.complainDate ?? 'N/A'}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Complaint Status: ${statusData.complainStatus ?? 'N/A'}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Message: ${statusData.message?.isEmpty ?? true ? 'N/A' : statusData.message}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
