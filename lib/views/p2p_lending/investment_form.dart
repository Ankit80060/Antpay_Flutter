import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_date_picker.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/place_model/bank_list_model.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/company_list.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/model/place_model/qualification_model.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_kyc_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class InvestmentKycForm extends StatelessWidget {
  InvestmentKycForm({super.key});
  final controller = Get.put(InvestmentKYCFormController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      
      body: Obx(() {
        // if (controller.isLoading.value) {
        //   return const Center(
        //     child: Customloader(),
        //   );
        // }
        final step = controller.currentStep.value;
        final isStep1 = step == 0;

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), blurRadius: 5),
                ],
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text('Lend-Social', style: CustomStyles.p20500),
                    const SizedBox(
                      height: 5,
                    ),

                    if (isStep1) ...[
                      Text(
                        'Personal Details',
                        style: CustomStyles.black16600,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: controller.firstNameController,
                        labelText: "Full Name",
                        hintText: 'Enter your Full Name',
                        textInputType: TextInputType.name,
                        onChanged: (p0) {},
                        inputformater: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z ]')),
                          LengthLimitingTextInputFormatter(30),
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Full Name";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: controller.emailController,
                        labelText: "Email",
                        hintText: 'Enter your Email',
                        textInputType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Email";
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(v)) {
                            return "Enter valid Email";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: controller.mobileController,
                        labelText: "Mobile Number",
                        hintText: 'Enter your Mobile No.',
                        textInputType: TextInputType.number,
                        length: 10,
                        inputformater: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Mobile Number";
                          } else if (v.length != 10) {
                            return "Mobile No. must be 10 digits";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: controller.aadhaarController,
                        labelText: "Aadhar Number",
                        hintText: 'Enter your Aadhaar No.',
                        textInputType: TextInputType.number,
                        inputformater: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Aadhaar Number";
                          } else if (v.length != 12) {
                            return "Aadhaar must be 12 digits";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: controller.panController,
                        labelText: "PAN Number",
                        hintText: 'Enter your PAN No.',
                        textInputType: TextInputType.text,
                        inputformater: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter PAN Number";
                          } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$')
                              .hasMatch(v)) {
                            return "Enter valid PAN (e.g., ABCDE1234F)";
                          }
                          return null;
                        },
                      ),
                      CustomdatePicker(
                        controller: controller.dobController,
                        labelText: "Date of Birth",
                        firstDate: DateTime(
                          DateTime.now().year - 50,
                        ),
                        lastDate: DateTime.now(),
                      ),
                      Obx(() => CustomDropdownFormField<String>(
                            labelText: "Gender",
                            hintText: "Select Gender",
                            items: controller.genderList.map((g) {
                              return DropdownMenuItem<String>(
                                value: g,
                                child: Text(g, style: CustomStyles.black12400),
                              );
                            }).toList(),
                            selectedValue:
                                controller.selectedGender.value.isEmpty
                                    ? null
                                    : controller.selectedGender.value,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please Select a Gender";
                              }
                              return null;
                            },
                            onChanged: (val) =>
                                controller.selectedGender.value = val!,
                          )),
                      CustomTextField(
                        controller: controller.pincodeController,
                        labelText: "Pincode",
                        hintText: 'Enter your Pincode',
                        textInputType: TextInputType.number,
                        inputformater: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Pincode";
                          } else if (v.length != 6) {
                            return "Pincode must be 6 digits";
                          }
                          return null;
                        },
                      ),
                      Obx(() {
                        if (controller.stateList.isEmpty) {
                          return const Text("Loading states...");
                        }
                  

                        return CustomTypeAheadFormField<StateList>(
                          controller: controller.stateSearchController,
                          labelText: "State",
                          hintText: "Search State",
                          suggestionsCallback: (pattern) async {
                            return controller.searchState(pattern);
                          },
                          itemBuilder: (context, StateList suggestion) {
                            return ListTile(
                                title: Text(suggestion.state ?? 'NA'));
                          },
                          onSuggestionSelected: (StateList suggestion) {
                            controller.selectedState.value = suggestion;
                            controller.stateSearchController.text =
                                suggestion.state ?? '';
                            controller.selectedCity.value = null;
                            controller.citySearchController.clear();
                            controller.initCityList(suggestion.code);
                          },
                          validator: (val) =>
                              controller.selectedState.value == null
                                  ? "Please select a state"
                                  : null,
                        );
                      }),
                      Obx(() {
                        if (controller.cityList.isEmpty) {
                          return SizedBox();
                        }
                   

                        return CustomTypeAheadFormField<City>(
                          controller: controller.citySearchController,
                          labelText: "City",
                          hintText: "Search City",
                          suggestionsCallback: (pattern) async {
                            return controller.searchCity(pattern);
                          },
                          itemBuilder: (context, City suggestion) {
                            return ListTile(
                              title: Text(suggestion.cityName ?? 'NA'),
                            );
                          },
                          onSuggestionSelected: (City suggestion) {
                            controller.selectedCity.value = suggestion;
                            controller.citySearchController.text =
                                suggestion.cityName ?? '';
                          },
                          validator: (val) =>
                              controller.selectedCity.value == null
                                  ? "Please select a city"
                                  : null,
                        );
                      }),
                      Obx(() {
                        if (controller.occupationList.isEmpty) {
                          return SizedBox();
                        }

                        return CustomTypeAheadFormField<OccupationList>(
                          controller: controller.occupationSearchController,
                          labelText: "Occupation",
                          hintText: "Search Occupation",
                          suggestionsCallback: (pattern) async {
                            return controller.searchOccupation(pattern);
                          },
                          itemBuilder: (context, OccupationList suggestion) {
                            return ListTile(
                              title: Text(suggestion.occupation ?? 'NA'),
                            );
                          },
                          onSuggestionSelected: (OccupationList suggestion) {
                            controller.selectedOccupation.value = suggestion;
                            controller.occupationSearchController.text =
                                suggestion.occupation ?? '';
                          },
                          validator: (val) =>
                              controller.selectedOccupation.value == null
                                  ? "Please select a occupation"
                                  : null,
                        );
                         return SizedBox();
                      }),
                      CustomTextField(
                        controller: controller.annualIncomeController,
                        labelText: "Annual Income",
                        hintText: 'Enter your Annual Income',
                        textInputType: TextInputType.number,
                        length: 10,
                        inputformater: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Annual Income";
                          }
                          return null;
                        },
                      ),
                      Obx(() {
                        if (controller.qualificationList.isEmpty) {
                          return SizedBox();
                        }

                        return CustomTypeAheadFormField<QualificationList>(
                          controller: controller.qualificationSearchController,
                          labelText: "Qualification",
                          hintText: "Search Qualification",
                          suggestionsCallback: (pattern) async {
                            return controller.searchQualification(pattern);
                          },
                          itemBuilder: (context, QualificationList suggestion) {
                            return ListTile(
                              title: Text(suggestion.qualification ?? 'NA'),
                            );
                          },
                          onSuggestionSelected: (QualificationList suggestion) {
                            controller.selectedQualification.value = suggestion;
                            controller.qualificationSearchController.text =
                                suggestion.qualification ?? '';
                          },
                          validator: (val) =>
                              controller.selectedQualification.value == null
                                  ? "Please select a Qualification"
                                  : null,
                        );
                         return SizedBox();
                      }),
                      Obx(() {
                        if (controller.companyTypeList.isEmpty) {
                          return SizedBox();
                        }

                        return CustomTypeAheadFormField<String>(
                          controller: controller.companyTypeSearchController,
                          labelText: "Company Type",
                          hintText: "Search Company Type",
                          suggestionsCallback: (pattern) async {
                            return controller.searchCompanyType(pattern);
                          },
                          itemBuilder: (context, String suggestion) {
                            return ListTile(
                              title: Text(suggestion ?? 'NA'),
                            );
                          },
                          onSuggestionSelected: (String suggestion) {
                            controller.selectedCompanyType.value = suggestion;
                            controller.companyTypeSearchController.text =
                                suggestion ?? '';
                          },
                          validator: (val) =>
                              controller.selectedCompanyType.value == null
                                  ? "Please select a Company Type"
                                  : null,
                        );
                       
                      }),
                      Obx(() {
                        if (controller.companyNameList.isEmpty) {
                          return SizedBox();
                        }
                        return CustomTypeAheadFormField<Company>(
                          controller: controller.companyNameSearchController,
                          labelText: "Company Name",
                          hintText: "Search Company Name",
                          suggestionsCallback: (pattern) async {
                            return controller.searchCompanyName(pattern);
                          },
                          itemBuilder: (context, Company suggestion) {
                            return ListTile(
                              title: Text(suggestion.companyName ?? 'NA'),
                            );
                          },
                          onSuggestionSelected: (Company suggestion) {
                            controller.selectedCompanyName.value = suggestion;
                            controller.companyNameSearchController.text =
                                suggestion.companyName ?? '';
                          },
                          validator: (val) =>
                              controller.selectedCompanyName.value == null
                                  ? "Please select a company name"
                                  : null,
                        );
                      
                      }),
                    ] else ...[
                      Text(
                        'Account Details',
                        style: CustomStyles.black16600,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: controller.accountNumberController,
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
                        controller: controller.reEnterAccountNumberController,
                        labelText: "Re-Enter Account Number",
                        hintText: "Enter Re-Enter Account Number",
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Re-enter Account Number";
                          } else if (val !=
                              controller.accountNumberController.text) {
                            return "Account numbers do not match";
                          }
                          return null;
                        },
                      ),
                      Obx(() {
                        if (controller.bankList.isEmpty) {
                          return SizedBox();
                        }

                        return CustomTypeAheadFormField<BankList>(
                          controller: controller.searchBnakNameSearchController,
                          labelText: "Bank Name",
                          hintText: "Bank Name",
                          suggestionsCallback: (pattern) async {
                            return controller.searchBankName(pattern);
                          },
                          itemBuilder: (context, BankList suggestion) {
                            return ListTile(
                              title: Text(suggestion.name ?? 'NA'),
                            );
                          },
                          onSuggestionSelected: (BankList suggestion) {
                            controller.selectedbankName.value = suggestion;
                            controller.searchBnakNameSearchController.text =
                                suggestion.name ?? '';
                          },
                          validator: (val) =>
                              controller.selectedbankName.value == null
                                  ? "Please select a bank name"
                                  : null,
                        );
                    
                      }),
                      CustomTextField(
                        controller: controller.ifscCodeController,
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
                    ],
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        if (step > 0)
                          Expanded(
                            child: CustomElevatedButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.currentStep.value--;
                                }
                              },
                              text: "Back",
                              bgColor: Colors.grey.shade400,
                            ),
                          ),
                        if (step > 0) const SizedBox(width: 10),
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                if (step == 0) {
                                  controller.currentStep.value = 1;
                                  controller.initBankList();
                                } else {
                                  controller.submitFullKycStatusAndProceed();
                                }
                              }
                            },
                            text: step == 0 ? "Proceed" : "Submit",
                          ),
                        ),
                      ],
                    ),
                    // buildDotPager(step)
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
