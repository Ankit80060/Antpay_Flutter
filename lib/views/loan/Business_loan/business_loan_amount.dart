import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/viewmodels/loan/Businees_loan_controller/business_loan_amount_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class BusinessLoanAmount extends StatelessWidget {
  BusinessLoanAmount({Key? key}) : super(key: key);

  final controller = Get.put(BusinessLoanController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final imagePath = args?['image'] ?? 'assets/images/ic_personal_loan.png';
    final loanType = args?['loanType'] ?? 'Personal Loan';
    final loanName = args?['loanName'] ?? 'Personal Loan';

    return MainScaffold(
    
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Form(
          key: _formKey,
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
                        ),
                        const SizedBox(height: 10),
                        Text(
                          loanType,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: controller.loanAmountController,
                    labelText: "Loan Amount",
                    hintText: "Select Loan Amount",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }

                      if (!RegExp(r'^[1-9]\d*$').hasMatch(value)) {
                        return 'Please enter a valid number without leading zeros';
                      }

                      int? parsedValue = int.tryParse(value);

                      if (parsedValue == null) {
                        return 'Please enter a valid number';
                      } else if (parsedValue < 5000) {
                        return 'Loan Amount should be greater than 5000';
                      } else if (parsedValue > 50000000) {
                        return 'Loan Amount should be less than 50000000';
                      }

                      return null;
                    },
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
                      if (value == null || value.isEmpty)
                        return 'This field is required';
                      if (!RegExp(r'^[1-9]\d*$').hasMatch(value))
                        return 'Enter a valid number without leading zeros';
                      if (value.length != 6) return 'Invalid Postal Code';
                      return null;
                    },
                    onChanged: (val) => controller.postalCode.value = val,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final Map<String, dynamic>? personalData =
                              Get.arguments as Map<String, dynamic>?;

                          if (personalData == null) {
                            Get.snackbar("Error",
                                "No data received from previous screen");
                            return;
                          }

                          //   // Create LoanRequestModel
                          //   final loanRequestModel =
                          //       occuptiondetailsController.createLoanRequestModel(
                          //     Get.arguments as Map<String, dynamic>?,
                          //     firstName: personalData["firstName"] ?? "",
                          //     lastName: personalData["lastName"] ?? "",
                          //     email: personalData["email"] ?? "",
                          //     mobile: personalData["mobile"] ?? "",
                          //     dob: personalData["dob"] ?? "",
                          //     gender: personalData["gender"] ?? "",
                          //     maritalStatus: personalData["maritalStatus"] ?? "",
                          //     qualification: personalData["qualification"] ?? "",
                          //     state: personalData["state"] ?? "",
                          //     city: personalData["city"] ?? "",
                          //   );

                          //   final jsonData = loanRequestModel.toJson();
                          //   print("Generated JSON: $jsonData");

                          //   await occuptiondetailsController
                          //       .submitLoanRequest(loanRequestModel);
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
                        style: TextStyle(color: Color(0xFF6F6E6E)),
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
