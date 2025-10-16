import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_date_picker.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_time_picker.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/relationship_manager_controller/relationship_manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class RelationShipManagerScreen extends StatelessWidget {
  RelationShipManagerScreen({super.key});
  final controller = Get.put(RelationShipMangerController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              elevation: 2,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/plan%2Fcus_rm_banner.png?alt=media&token=ab653563-9e8e-48ee-8f33-1d00b9b1bc27',
                errorBuilder: (context, child, loadingProgress) {
                  return Customloader();
                },
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 400,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    width: double.infinity,
                    height: 100,
                    image: AssetImage("assets/sidebar/rm-s.png"),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Need Assistance !",
                    style: CustomStyles.black14500,
                  ),
                  Text(
                    "Please schedule a call back with chat support team and they would be happy to help",
                    style: CustomStyles.black12300,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomdatePicker(
                        controller: controller.dateController,
                        firstDate: DateTime.now(),
                      )),
                const      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTimePicker(
                              controller: controller.timeController)),
                    ],
                  ),
               const   SizedBox(
                    height: 20,
                  ),
                  Obx((){
                    return controller.isLoading.value ? const Customloader() : CustomElevatedButton(
                    width: 200,
                    onPressed: () {
                      final datetime = controller.combinedDateTime.trim();
                      print(datetime);
                      if (datetime.isEmpty) {
                        CustomToast.show('Please select date and time');
                        return;
                      } else {
                        controller.getReminderCallback(datetime);
                      }

                      print('Selected datetime: $datetime');
                    },
                    text: "Request Callback",
                  );
                  })
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
