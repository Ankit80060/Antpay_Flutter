import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/viewmodels/recharge/disputecontroller/PostComplaintController/post_complaint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../MainScaffold.dart';

class PostComplaint extends StatelessWidget {
  final PostComplaintController controller = Get.put(PostComplaintController());
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Obx(() {
              if (controller.complaintResponse.value == null) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Post Complaint",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 12),
                        CustomDropdownFormField<String>(
                          labelText: "Complaint Type",
                          selectedValue: controller.selectedComplaintType.value,
                          items: controller.complaintTypeList
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            if (val != null) controller.setComplaintType(val);
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.transactionIdController,
                          labelText: "Transaction ID",
                          hintText: "Enter Transaction ID",
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter Transaction ID";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.messageController,
                          labelText: "Message",
                          hintText: "Enter Message",
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter Message";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        controller.isLoading.value
                            ? Center(child: Customloader())
                            : Align(
                                alignment: Alignment.centerRight,
                                child: CustomElevatedButton(
                                  text: "Proceed",
                                  onPressed: controller.submitComplaint,
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
            const SizedBox(height: 20),
            Obx(() {
              final resp = controller.complaintResponse.value;
              if (resp != null && resp.status == 1) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Complaint Submitted Successfully!",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      Text("Complaint ID: ${resp.complainId ?? 'N/A'}",
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 5),
                      Text(
                          "Message: ${controller.messageController.text ?? 'N/A'}",
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
