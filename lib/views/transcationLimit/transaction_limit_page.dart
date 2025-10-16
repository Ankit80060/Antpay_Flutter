import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/views/transcationLimit/controller/transction_limit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widget/custom_appbar.dart';
import '../../MainScaffold.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../custom_widget/customstyles.dart';
import '../../res/color_palette.dart';

class TransactionLimitPage extends StatelessWidget {
  TransactionLimitPage({Key? key}) : super(key: key);
  final controller = Get.find<TransctionLimitController>();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 2,
                  surfaceTintColor: Colors.transparent,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Update Limit for Transaction',
                              style: CustomStyles.black16600),
                          SizedBox(
                            height: 16.0,
                          ),
                          Obx(
                            () => CustomDropdownWithoutUnderLine(
                              items: controller.dropDownData1,
                              value:
                                  controller.selectedDropDownId.value ?? null,
                              onChanged: (val) =>
                                  controller.handelSelectionChange(val),
                              textStyle: CustomStyles.black14400,
                              dropdownColor: Colors.white,
                              borderColor: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enable/Disable',
                                style: CustomStyles.black12400,
                              ),

                              // Toggle Switch
                              Transform.scale(
                                  scale: 0.8,
                                  child: Obx(
                                    () => Switch(
                                      activeColor: AppColors.bgcolor,
                                      inactiveThumbColor: AppColors.bordercolor,
                                      inactiveTrackColor:
                                          AppColors.black54.withOpacity(0.2),
                                      trackOutlineWidth:
                                          MaterialStatePropertyAll(0),
                                      value: controller.isSwitchOn.value,
                                      onChanged: (val) =>
                                          controller.handelChangeSwitch(val),
                                    ),
                                  )),
                            ],
                          ),
                          //             SizedBox(
                          // height: 10.0,
                          //             ),

                          Obx(() => CustomTextField(
                                controller: controller.preTransactionAmount,
                                hintText: 'Enter Amount',
                                labelText: 'Per Transaction Limit',
                                textInputType: TextInputType.number,
                                length: 5,
                                enabled: controller.isSwitchOn.value,
                              )),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                             '(Max Limit ${controller.kycStatus.value == 'MIN KYC' ? 10000 : 10000})',
                              style: CustomStyles.black12400
                                  .copyWith(color: AppColors.black54),
                            ),
                          ),
                          CustomTextField(
                            controller: controller.dailyTransactionAmount,
                            hintText: 'Enter Amount',
                            labelText: 'Daily Transaction Limit',
                            textInputType: TextInputType.number,
                            length: 5,
                            enabled: controller.isSwitchOn.value,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                               '(Max Limit ${controller.kycStatus.value == 'MIN KYC' ? 10000 : 10000})',
                            
                              style: CustomStyles.black12400
                                  .copyWith(color: AppColors.black54),
                            ),
                          ),
                          CustomTextField(
                            controller: controller.monthlyTransactionAmount,
                            hintText: 'Enter Amount',
                            labelText: 'Monthly Transaction Limit',
                            textInputType: TextInputType.number,
                            length: 5,
                            enabled: controller.isSwitchOn.value,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                               '(Max Limit ${controller.kycStatus.value == 'MIN KYC' ? 10000 : 10000})',
                             style: CustomStyles.black12400
                                  .copyWith(color: AppColors.black54),
                            ),
                          ),
                          CustomTextField(
                            controller: controller.yearlyTransactionAmount,
                            hintText: 'Enter Amount',
                            labelText: 'Yearly Transaction Limit',
                            textInputType: TextInputType.number,
                            length: 5,
                            enabled: controller.isSwitchOn.value,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                               '(Max Limit ${controller.kycStatus.value == 'MIN KYC' ? 120000 : 120000})',
                            
                              style: CustomStyles.black12400
                                  .copyWith(color: AppColors.black54),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                                width: 120,
                                child: CustomElevatedButton(
                                  onPressed: () {
                                    controller.isSwitchOn.value
                                        ? controller.onSubmitLimit()
                                        :  CustomToast.show("Please Enable Transaction Limit");;
                                  },
                                  text: 'Submit',
                                )),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? Container(
                      color: Colors.black.withOpacity(0.03),
                      child: const Center(
                        child: Customloader(),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ]),
        ));
  }
}
