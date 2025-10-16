import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/utils/common_utils.dart';
import 'package:antpay_lite/viewmodels/loan/Car_loan_controller/carloancontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class CarLoanScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CarLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    print("CarLoanScreen received args: $args");
    final controller = Get.put(CarLoanController());

    return MainScaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildBanner(),
                  const SizedBox(height: 10),
                  Card(
                    color: ColorPalette.white,
                    surfaceTintColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Confirm Details",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            labelText: "Full Name",
                            hintText: "Enter Full Name",
                            controller: controller.nameController,
                            validator: (v) =>
                                v!.isEmpty ? "This field is required" : null,
                          ),
                          const SizedBox(height: 10),
                          Obx(() => CustomDropdownFormField<OccupationList>(
                                labelText: "Occupation",
                                hintText: "Select Occupation",
                                items: controller.occupationList.map((occ) {
                                  return DropdownMenuItem<OccupationList>(
                                    value: occ,
                                    child: Text(occ.occupation ?? "NA",
                                        style: CustomStyles.black12400),
                                  );
                                }).toList(),
                                selectedValue:
                                    controller.selectedOccupation.value,
                                validator: (val) => val == null
                                    ? "Please Select Occupation"
                                    : null,
                                onChanged: (val) =>
                                    controller.selectedOccupation.value = val,
                              )),
                          const SizedBox(height: 10),
                          CustomTextField(
                            labelText: "Net Monthly Salary",
                            hintText: "Enter Salary",
                            controller: controller.incomeController,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "This field is required";
                              }
                              if (!RegExp(r'^[1-9]\d*$').hasMatch(v)) {
                                return "Enter valid salary";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            labelText: "Contact Number",
                            hintText: "Enter Mobile Number",
                            controller: controller.contactController,
                            validator: (v) => v != null && v.length == 10
                                ? null
                                : "Enter 10 digit mobile number",
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: controller.panNumberController,
                            labelText: "PAN Number",
                            hintText: "Enter PAN Number",
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "Enter PAN Number";
                              } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$')
                                  .hasMatch(v)) {
                                return "Enter valid PAN (e.g., ABCDE1234F)";
                              }
                              return null;
                            },
                            onChanged: (val) =>
                                controller.panNumber.value = val,
                          ),
                          const SizedBox(height: 20),
                          Obx(() {
                            if (controller.loading.value) {
                              return const Center(child: Customloader());
                            }
                            return ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final loanData =
                                      LoanRequestModel(userData: UserData());
                                  await controller.submitForm(loanData);
                                  final status = controller.loanStatus.value;
                                  if (status != null) {
                                    _showAlertBox(context, status["status"],
                                        status["message"]);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CommonUtils.toColor("c5e6eb"),
                                minimumSize: const Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Text("Submit",
                                  style: TextStyle(
                                      color: CommonUtils.toColor("6f6e6e"))),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 1,
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/loan_banner%2Fcar_loan_banner.png?alt=media&token=d1c5c629-5fa4-4e23-b761-885f3e372027",
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loading) {
            if (loading == null) return child;
            return const Center(
              child: Customloader(),
            );
          },
        ),
      ),
    );
  }

  void _showAlertBox(BuildContext context, int? status, String? message) {
    Get.defaultDialog(
      title: status == 1 ? "Success" : "Unsuccessful",
      middleText: message ?? "Try again later",
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
    );
  }
}
