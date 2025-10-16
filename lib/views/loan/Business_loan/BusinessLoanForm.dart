import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/loan/Businees_loan_controller/BussinessLoanFormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class BusinessLoanForm extends StatelessWidget {
  BusinessLoanForm({super.key});
  final BusinessLoanFormController controller =
      Get.put(BusinessLoanFormController());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments is Map
        ? (Get.arguments as Map).cast<String, dynamic>()
        : null;
    final imagePath =
        args?['image']?.toString() ?? 'assets/images/ic_business_loan.png';
    final loanType = args?['loanType']?.toString() ?? 'Business Loan';
    final loanName = args?['loanName']?.toString() ?? 'Business Loan';

    return MainScaffold(
     
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Form(
          key: controller.formKey,
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          imagePath,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print("Image load error: $error");
                            return Image.asset(
                              'assets/images/ic_business_loan.png',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          loanType,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Salary Process",
                        hintText: "Select salary process",
                        items: controller.salaryProcessList.map((process) {
                          return DropdownMenuItem<String>(
                            value: process,
                            child:
                                Text(process, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue:
                            controller.selectedSalaryProcess.value.isEmpty
                                ? null
                                : controller.selectedSalaryProcess.value,
                        validator: (val) =>
                            val == null ? "Please select salary process" : null,
                        onChanged: (val) {
                          controller.selectedSalaryProcess.value = val ?? '';
                          controller.selectedBank.value = '';
                        },
                      )),
                  const SizedBox(height: 5),
                  Obx(() => Visibility(
                        visible: controller.selectedSalaryProcess.value ==
                            "Account Transfer",
                        child: CustomDropdownFormField<String>(
                          labelText: "Salary Bank",
                          hintText: "Select Bank",
                          items: controller.bankList.map((bank) {
                            return DropdownMenuItem<String>(
                              value: bank,
                              child: Text(bank, style: CustomStyles.black12400),
                            );
                          }).toList(),
                          selectedValue: controller.selectedBank.value.isEmpty
                              ? null
                              : controller.selectedBank.value,
                          onChanged: (val) =>
                              controller.selectedBank.value = val ?? '',
                          validator: (val) => val == null
                              ? "Please select Bank to Transfer"
                              : null,
                        ),
                      )),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: controller.netMonthlySalaryController,
                    labelText: "Net Monthly Salary",
                    hintText: "Enter Net Monthly Salary",
                    validator: controller.validateSalary,
                    onChanged: (val) => controller.netMonthlySalary.value = val,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: controller.ongoingLoanController,
                    labelText: "Ongoing Loan EMIs",
                    hintText: "Enter Ongoing Loan EMIs",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      int? parsedValue = int.tryParse(value);
                      if (parsedValue == null) {
                        return 'Please enter a valid number';
                      }
                      if (parsedValue > 10000000) {
                        return 'Ongoing EMI should be lesser than 10000000';
                      }
                      return null;
                    },
                    onChanged: (val) => controller.ongoingLoan.value = val,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: controller.loanAmountController,
                    labelText: "Loan Amount",
                    hintText: "Enter Loan Amount",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (!RegExp(r'^[1-9]\d*$').hasMatch(value)) {
                        return 'Enter a valid number without leading zeros';
                      }
                      int? val = int.tryParse(value);
                      if (val == null) {
                        return 'Please enter a valid number';
                      }
                      if (val < 5000) {
                        return 'Loan Amount should be greater than 5000';
                      }
                      if (val > 50000000) {
                        return 'Loan Amount should be less than 50000000';
                      }
                      return null;
                    },
                    onChanged: (val) => controller.loanAmount.value = val,
                  ),
                  const SizedBox(height: 5),
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
                    onChanged: (val) => controller.panNumber.value = val,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: controller.postalCodeController,
                    labelText: "Postal Code",
                    hintText: "Enter Postal Code",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (!RegExp(r'^[1-9]\d*$').hasMatch(value)) {
                        return 'Enter a valid number without leading zeros';
                      }
                      if (value.length != 6) {
                        return 'Invalid Postal Code';
                      }
                      return null;
                    },
                    onChanged: (val) => controller.postalCode.value = val,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) {
                          if (controller.previousData == null) {
                            Get.snackbar("Error",
                                "No data received from previous screen");
                            return;
                          }

                          final loanRequestModel =
                              controller.createLoanRequestModel();
                          await controller.submitLoanRequest(loanRequestModel);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC5E6EB),
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text(
                        'Proceed',
                        style: TextStyle(color: Color(0xFF6E6E6E)),
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
