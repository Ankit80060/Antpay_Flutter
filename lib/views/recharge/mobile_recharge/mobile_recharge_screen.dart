import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_controller.dart';
import 'package:antpay_lite/utils/common_utils.dart';

import '../../../MainScaffold.dart';

class MobileRechargeScreen extends StatelessWidget {
  const MobileRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MobileRechargeController controller = Get.find<MobileRechargeController>();

    return MainScaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Obx(
              () => AbsorbPointer(
                absorbing: controller.isLoading.value,
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Mobile Recharge',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
                              child: Text(
                                'Mobile No. *',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  controller: controller.mobileNumberController,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    counterText: '', // Hide character counter
                                    hintText: 'Enter a Mobile Number',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                      gapPadding: 0.5,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                      gapPadding: 0.5,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                    hintStyle: const TextStyle(fontSize: 14),
                                    suffixIcon: IconButton(
                                      icon: Image.asset(
                                        'assets/images/contactbook.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      onPressed: () async {
                                        await controller.pickContact();
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a mobile number';
                                    } else if (value.length != 10) {
                                      return 'Mobile number must be 10 digits';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () async {
                                    if (controller.mobileNumberController.text.isEmpty) {
                                      CommonUtils.showToast('Please enter a mobile number');
                                      return;
                                    }
                                    if (controller.mobileNumberController.text.length != 10) {
                                      CommonUtils.showToast('Mobile number must be 10 digits');
                                      return;
                                    }
                                    await controller.checkMobileNumber(context);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: ColorPalette.proceed_btn_bg_color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                  ),
                                  child: Text(
                                    'Proceed',
                                    style: TextStyle(
                                      color: ColorPalette.tab_title_dark,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (controller.errorMessage.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? Center(
                    child: Image.asset(
                      'assets/images/loader_image.gif',
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}