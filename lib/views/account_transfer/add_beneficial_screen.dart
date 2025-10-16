import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/account_transfer_controller/add_benefically_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class AddBeneficiaryScreen extends StatelessWidget {
  AddBeneficiaryScreen({super.key});
  final addBeneficiallyController = Get.put(AddBeneficiaryController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      // resizeToAvoidBottomInset: true,
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("CREATE NEW BENEFICIARY",
                                style: CustomStyles.black14600),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller:
                                  addBeneficiallyController.nameController,
                              labelText: "Name",
                              hintText: "Enter Name",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Name is required";
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: addBeneficiallyController
                                  .accountNumberController,
                              labelText: "Account Number",
                              hintText: "Enter Account Number",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Account Number required";
                                } else if (val.length < 9 || val.length > 18) {
                                  return "Account Number must be 9-18 digits";
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: addBeneficiallyController
                                  .reEnterAccountNumberController,
                              labelText: "Re-Enter Account Number",
                              hintText: "Enter Re-Enter Account Number",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Re-enter Account Number";
                                } else if (val !=
                                    addBeneficiallyController
                                        .accountNumberController.text) {
                                  return "Account numbers do not match";
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller:
                                  addBeneficiallyController.ifscCodeController,
                              labelText: "IFSC Code",
                              hintText: "Enter IFSC Code",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "IFSC required";
                                } else if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$')
                                    .hasMatch(val)) {
                                  return "Enter valid IFSC code";
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: addBeneficiallyController
                                  .mobileNumberController,
                              labelText: "Mobile Number*",
                              hintText: "Enter Mobile Number",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Mobile number required";
                                } else if (!RegExp(r'^[6-9]\d{9}$')
                                    .hasMatch(val)) {
                                  return "Enter valid 10-digit Mobile Number";
                                }
                                return null;
                              },
                              length: 10,
                            ),
                            Obx(() => CustomDropdownFormField<String>(
                                  labelText: "Group",
                                  hintText: "Select Group",
                                  items: addBeneficiallyController.groupList
                                      .map((g) {
                                    return DropdownMenuItem<String>(
                                      value: g,
                                      child: Text(g,
                                          style: CustomStyles.black12400),
                                    );
                                  }).toList(),
                                  selectedValue: addBeneficiallyController
                                          .selectedGroup.value.isEmpty
                                      ? null
                                      : addBeneficiallyController
                                          .selectedGroup.value,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Please Select a Group";
                                    }
                                    return null;
                                  },
                                  onChanged: (val) => addBeneficiallyController
                                      .selectedGroup.value = val!,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  addBeneficiallyController.sendOtp();
                                }
                              },
                              text: "Add Beneficiary",
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
