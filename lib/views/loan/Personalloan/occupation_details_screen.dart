import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/place_model/company_list.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/viewmodels/loan/Personalloan/occupation_details_controller.dart';
import 'package:antpay_lite/viewmodels/loan/Personalloan/personalloan_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class OccupationDetailsScreen extends StatelessWidget {
  OccupationDetailsScreen({super.key});
  final PersonalLoanController controller = Get.put(PersonalLoanController());
  final OccupationDetailsController occuptiondetailsController =
      Get.put(OccupationDetailsController());

  final _formKey = GlobalKey<FormState>();
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
                          imagePath, // Dynamically set image based on argument
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          loanType, // Display the passed loan type
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        selectedValue: controller.selectedOccupation.value,
                        validator: (val) =>
                            val == null ? "Please Select Occupation" : null,
                        onChanged: (val) =>
                            controller.selectedOccupation.value = val,
                      )),
                  const SizedBox(height: 5),

                  Obx(() {
                    if (occuptiondetailsController.companyNameList.isEmpty) {
                      return SizedBox();
                    }

                    // return CustomTypeAheadFormField<Company>(
                    //   controller: occuptiondetailsController
                    //       .companyNameSearchController,
                    //   labelText: "Copany Name",
                    //   hintText: "Search Company Name",
                    //   suggestionsCallback: (pattern) async {
                    //     return occuptiondetailsController
                    //         .searchCompanyName(pattern);
                    //   },
                    //   itemBuilder: (context, Company suggestion) {
                    //     return Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 10, vertical: 10),
                    //       child: Text(
                    //         suggestion.companyName ?? "NA",
                    //         style: const TextStyle(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w300,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   onSuggestionSelected: (Company suggestion) {
                    //     occuptiondetailsController.selectedCompanyName.value =
                    //         suggestion;
                    //     occuptiondetailsController.companyNameSearchController
                    //         .text = suggestion.companyName ?? '';
                    //   },
                    //   validator: (val) => occuptiondetailsController
                    //               .selectedCompanyName.value ==
                    //           null
                    //       ? "Please select a company name"
                    //       : null,
                    // );
                    return SizedBox();
                  }),

                  // const SizedBox(height: 10),
                  // Obx(() => Text(
                  //       "Selected: ${occuptiondetailsController.selectedCompany.value?.companyName ?? 'None'}",
                  //       style: const TextStyle(
                  //           fontSize: 16, fontWeight: FontWeight.bold),
                  //     )),
                  const SizedBox(height: 5),
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Company Type",
                        hintText: "Select your company type",
                        items: occuptiondetailsController.companyTypeList
                            .map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue: occuptiondetailsController
                            .selectedCompanyType.value,
                        validator: (val) => val == null || val.isEmpty
                            ? "Please select company type"
                            : null,
                        onChanged: (val) => occuptiondetailsController
                            .selectedCompanyType.value = val,
                      )),
                  const SizedBox(height: 5),
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Salary Process",
                        hintText: "Select salary process",
                        items: occuptiondetailsController.salaryProcessList
                            .map((process) {
                          return DropdownMenuItem<String>(
                            value: process,
                            child:
                                Text(process, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue: occuptiondetailsController
                            .selectedSalaryProcess.value,
                        validator: (val) =>
                            val == null ? "Please select salary process" : null,
                        onChanged: (val) {
                          occuptiondetailsController
                              .selectedSalaryProcess.value = val;
                          occuptiondetailsController.selectedBank.value =
                              null; // reset bank when salary process changes
                        },
                      )),

                  const SizedBox(height: 5),

                  Obx(() {
                    if (occuptiondetailsController
                            .selectedSalaryProcess.value !=
                        "Account Transfer") {
                      return const SizedBox
                          .shrink(); // nothing if not "Account Transfer"
                    }
                    return CustomDropdownFormField<String>(
                      labelText: "Salary Bank",
                      hintText: "Select Bank",
                      items: occuptiondetailsController.bankList.map((bank) {
                        return DropdownMenuItem<String>(
                          value: bank,
                          child: Text(bank, style: CustomStyles.black12400),
                        );
                      }).toList(),
                      selectedValue:
                          occuptiondetailsController.selectedBank.value,
                      onChanged: (val) =>
                          occuptiondetailsController.selectedBank.value = val,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please select Bank to Transfer";
                        }
                        return null;
                      },
                    );
                  }),

                  const SizedBox(height: 5),
                  CustomTextField(
                    controller:
                        occuptiondetailsController.netMonthlySalaryController,
                    labelText: "Net Monthly Salary",
                    hintText: "Enter Net Monthly Salary",
                    // keyboardType: TextInputType.number,
                    validator: occuptiondetailsController.validateSalary,
                    onChanged: (val) =>
                        occuptiondetailsController.netMonthlySalary.value = val,
                  ),
                  const SizedBox(height: 5),

                  CustomTextField(
                    controller:
                        occuptiondetailsController.ongoingLoanController,
                    labelText: "Ongoing Loan EMIs",
                    hintText: "Enter Ongoing Loan EMIs",
                    validator: (value) {
                      // Required check
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }

                      // Must be numeric
                      int? parsedValue = int.tryParse(value);
                      if (parsedValue == null) {
                        return 'Please enter a valid number';
                      }

                      // Range check
                      if (parsedValue > 10000000) {
                        return 'Ongoing EMI should be lesser than 10000000';
                      }

                      return null;
                    },
                    onChanged: (val) =>
                        occuptiondetailsController.ongoingLoan.value = val,
                  ),
                  const SizedBox(height: 5),

                  CustomTextField(
                    controller: controller.loanAmountController,
                    labelText: "Loan Amount",
                    hintText: "Enter Loan Amount",
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'This field is required';
                      if (!RegExp(r'^[1-9]\d*$').hasMatch(value))
                        return 'Enter a valid number without leading zeros';
                      int? val = int.tryParse(value);
                      if (val == null) return 'Please enter a valid number';
                      if (val < 5000)
                        return 'Loan Amount should be greater than 5000';
                      if (val > 50000000)
                        return 'Loan Amount should be less than 50000000';
                      return null;
                    },
                    onChanged: (val) =>
                        occuptiondetailsController.loanAmount.value = val,
                  ),

                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: occuptiondetailsController.panNumberController,
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
                        occuptiondetailsController.panNumber.value = val,
                  ),

                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: occuptiondetailsController.postalCodeController,
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
                    onChanged: (val) =>
                        occuptiondetailsController.postalCode.value = val,
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

                          // Create LoanRequestModel
                          final loanRequestModel =
                              occuptiondetailsController.createLoanRequestModel(
                            Get.arguments as Map<String, dynamic>?,
                            firstName: personalData["firstName"] ?? "",
                            lastName: personalData["lastName"] ?? "",
                            email: personalData["email"] ?? "",
                            mobile: personalData["mobile"] ?? "",
                            dob: personalData["dob"] ?? "",
                            gender: personalData["gender"] ?? "",
                            maritalStatus: personalData["maritalStatus"] ?? "",
                            qualification: personalData["qualification"] ?? "",
                            state: personalData["state"] ?? "",
                            city: personalData["city"] ?? "",
                          );

                          final jsonData = loanRequestModel.toJson();
                          print("Generated JSON: $jsonData");

                          await occuptiondetailsController
                              .submitLoanRequest(loanRequestModel);
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
