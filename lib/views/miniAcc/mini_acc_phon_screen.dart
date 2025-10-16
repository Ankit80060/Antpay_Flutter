import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/views/miniAcc/controller/mini_acc_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../custom_widget/custom_appbar.dart';
import '../../MainScaffold.dart';
import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_textfield.dart';
import '../../res/color_palette.dart';
import '../../utils/routes/routes_name.dart';


class MiniAccPhonePage extends StatelessWidget {
  MiniAccPhonePage({Key? key}) : super(key: key);
  final controller = Get.put(MiniAccountPhoneController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
         body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/profileicon1.png',
                    height: 120.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                 
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                          Image.asset(
                   'assets/images/profile_ant_hand.png',
             width: 120,
                 ),
                        Padding(
                        padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                        
                            children: [
                              
                              Text(
                                'Mobile Number kyc',
                                style: CustomStyles.black20500.copyWith(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Please verify mobile number for activation of Mini Account",
                                style: CustomStyles.grey123
                                    .copyWith(color: AppColors.black54),
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.mobileController,
                                hintText: 'Enter Mobile Number',
                                labelText: 'Mobile Number',
                                enabled: false,
                                textInputType: TextInputType.phone,
                                length: 10,
                                onChanged: (p0) {},
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                           Obx(() =>   controller.isLoading.value
                                          ? Image.asset(
                          'assets/images/loader_image.gif',
                          width: 100,
                          height: 50,
                                          )
                                        
                                   :    Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: CustomElevatedButton(
                                    onPressed: () async {
                                      final mobile =
                                          controller.mobileController.text.trim();
                        
                                      if (mobile.isEmpty) {
                                        CustomToast.show(
                                            "Please Enter Mobile Number");
                                        return;
                                      }
                                       
                                      await controller.sendOtp();
                                    },
                                    text: 'SUBMIT',
                                  ),
                                ),
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
