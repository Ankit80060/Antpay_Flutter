import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/feedback_controller/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});
  final feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Container(    padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                  child: Column(
                    children: [
                    const   SizedBox(height: 10,),
                      Text("Feedback",style: CustomStyles.black20500,),
                   const   SizedBox(height: 15,),
                      CustomTextField(
                          controller: feedbackController.nameController,
                          labelText: "Name*",
                          hintText: "Enter Name"),
                      CustomTextField(
                           fillColor: Colors.grey.shade300,
                          controller: feedbackController.phoneController,
                          labelText: "Phone*",readOnly: true,
                          hintText: "Enter Phone"),
                      CustomTextField(
                     
                          controller: feedbackController.subjectController,
                          labelText: "Subject",
                          hintText: "Enter Subject"),
                      CustomTextField(
                          controller: feedbackController.messageController,
                          labelText: "Message*",
                          maxLine: 5,
                          hintText: "Enter Message",),
                       const     SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                      feedbackController.submitFeedback();
                        },
                        text: "Send Feedback",
                      ),
                 
                    ],
                  ),
                ),
               const SizedBox(height: 20,),
                   Obx(() {
  if (feedbackController.isLoading.value) {
    return const Center(child: Customloader());
  }

  if (feedbackController.feedbackList.isEmpty) {
    return  Center(child: Text("No feedback available",style: CustomStyles.black12400,));
  }

  return ListView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: feedbackController.feedbackList.length,
    itemBuilder: (context, index) {
      var feedbackItem = feedbackController.feedbackList[index];

      return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child:Image.asset("assets/images/feedback.png"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User ID: ${feedbackItem.userId}",
                        style: CustomStyles.black12400,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        feedbackItem.userFeedback,
                        style: CustomStyles.black12300,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  feedbackItem.createdDate,
                  style: CustomStyles.grey115,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
