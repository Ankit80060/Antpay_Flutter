import 'dart:io';

import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_date_picker.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_radio_btn.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class ProfileFormScreen extends StatelessWidget {
  ProfileFormScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5),
            ],
          ),
          child: Obx(() {
            final step = controller.currentStep.value;
            final isStep1 = step == 0;

            return Column(
              children: [
             
            

                if (isStep1) ...[
                  CustomTextField(
                    controller: controller.nameController,
                    labelText: "Name",
                    hintText: "Enter Name",
                  ),
                  CustomTextField(
                    controller: controller.emailController,
                    labelText: "Email",
                    hintText: "Enter Email",
                  ),
                  CustomTextField(
                    enabled: controller.mobileController.value.text.isEmpty
                        ? true
                        : false,
                    fillColor: controller.mobileController.value.text.isEmpty
                        ? Colors.white
                        : Colors.grey.shade200,
                    controller: controller.mobileController,
                    labelText: "Mobile Number",
                    hintText: "Enter Mobile Number",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gender", style: CustomStyles.black12400),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() => Row(
                            children: [
                              CustomRadioOption(
                                value: "Male",
                                groupValue: controller.gender.value,
                                onChanged: (val) =>
                                    controller.gender.value = val!,
                                label: "Male",
                                textStyle: CustomStyles.black12400,
                              ),
                              const SizedBox(width: 20),
                              CustomRadioOption(
                                value: "Female",
                                groupValue: controller.gender.value,
                                onChanged: (val) =>
                                    controller.gender.value = val!,
                                label: "Female",
                                textStyle: CustomStyles.black12400,
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropdownFormField<String>(
                    labelText: "Marital Status",
                    hintText: "Select Marital Status",
                    items: controller.maritialList.map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status, style: CustomStyles.black12400),
                      );
                    }).toList(),
                    selectedValue: controller.selectedMaritalStatus.value,
                    onChanged: (val) =>
                        controller.selectedMaritalStatus.value = val,
                  ),
                  CustomdatePicker(
                    controller: controller.dobController,
                    labelText: "Date of Birth",
                    firstDate: DateTime(
                      DateTime.now().year - 50,
                    ),
                    lastDate: DateTime.now(),
                  ),
                ] else ...[
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Occupation",
                        hintText: "Select Occupation",
                        items: controller.occupationList.map((v) {
                          return DropdownMenuItem<String>(
                            value: v,
                            child: Text(v, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue: controller.selectedOccupation.value,
                        validator: (val) =>
                            val == null ? "Please Select an Occupation" : null,
                        onChanged: (val) =>
                            controller.selectedOccupation.value = val,
                      )),
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Education",
                        hintText: "Select Education",
                        items: controller.educationList.map((edu) {
                          return DropdownMenuItem<String>(
                            value: edu,
                            child: Text(edu, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue: controller.selectedEducation.value,
                        validator: (val) =>
                            val == null ? "Please Select Education" : null,
                        onChanged: (val) =>
                            controller.selectedEducation.value = val,
                      )),
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Annual Income",
                        hintText: "Select Annual Income",
                        items: controller.annualIncomeList.map((income) {
                          return DropdownMenuItem<String>(
                            value: income,
                            child: Text(income, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue: controller.selectedAnnualIncome.value,
                        validator: (val) =>
                            val == null ? "Please Select Annual Income" : null,
                        onChanged: (val) =>
                            controller.selectedAnnualIncome.value = val,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Do you invest in Equility Markets, Mutual Funds and Fixed Deposits?",
                              style: CustomStyles.black12400),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(() => Row(
                                children: [
                                  CustomRadioOption(
                                    value: "Yes",
                                    groupValue: controller.selectInvest.value,
                                    onChanged: (val) =>
                                        controller.selectInvest.value = val!,
                                    label: "Yes",
                                    textStyle: CustomStyles.black12400,
                                  ),
                                  const SizedBox(width: 20),
                                  CustomRadioOption(
                                    value: "No",
                                    groupValue: controller.selectInvest.value,
                                    onChanged: (val) =>
                                        controller.selectInvest.value = val!,
                                    label: "No",
                                    textStyle: CustomStyles.black12400,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Do you own a house, car or two wheeler?",
                          style: CustomStyles.black12400),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() => Row(
                            children: [
                              CustomRadioOption(
                                value: "Yes",
                                groupValue: controller.selectOwnAssets.value,
                                onChanged: (val) =>
                                    controller.selectOwnAssets.value = val!,
                                label: "Yes",
                                textStyle: CustomStyles.black12400,
                              ),
                              const SizedBox(width: 20),
                              CustomRadioOption(
                                value: "No",
                                groupValue: controller.selectOwnAssets.value,
                                onChanged: (val) =>
                                    controller.selectOwnAssets.value = val!,
                                label: "No",
                                textStyle: CustomStyles.black12400,
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (step > 0)
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            controller.currentStep.value--;
                          },
                          text: "Back",
                          bgColor: Colors.grey.shade400,
                        ),
                      ),
                    if (step > 0) const SizedBox(width: 10),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                          if (step == 0) {
                            controller.currentStep.value = 1;
                          } else {
                            controller.updateProfile();
                          }
                        },
                        text: step == 0 ? "Proceed" : "Submit",
                      ),
                    ),
                  ],
                ),
                // buildDotPager(step)
              ],
            );
          }),
        ),
      ),
    );
  }
  // Container buildDotPager(int index) {
  // return Container(
  //   height: 10,
  //   width: controller.currentStep.value == index ? 30 : 15,
  //   margin: const EdgeInsets.only(right: 5),
  //   decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       color: controller.currentStep == index
  //           ? Colors.grey
  //           : CustomStyles.bgcolor),
  // );
  // }
}
