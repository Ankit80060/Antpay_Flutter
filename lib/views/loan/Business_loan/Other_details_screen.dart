import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_date_picker.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/viewmodels/loan/Businees_loan_controller/Other_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class OtherDetailsScreen extends StatelessWidget {
  OtherDetailsScreen({super.key});
  final OtherDetailsController controller = Get.put(OtherDetailsController());

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final imagePath = args?['image'] ?? 'assets/images/ic_business_loan.png';
    final loanType = args?['loanType'] ?? 'Personal Loan';
    final loanName = args?['loanName'] ?? 'Personal Loan';
    return MainScaffold(
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Form(
          key: controller.formKey, // Use controller's formKey here
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
                          'Other Details'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Debug the selected Occupation value
                        Obx(() => Text(
                              'Selected Occupation: ${controller.data['Occupation'] ?? 'Not set'}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            )),
                      ],
                    ),
                  ),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Business' ||
                                controller.data['Occupation'] ==
                                    'Loan Against Property')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomDropdownFormField<String>(
                              labelText: 'Profession Type',
                              hintText: 'Select Profession Type',
                              items: [
                                'Doctor',
                                'Teacher',
                                'CA',
                                'CS',
                                'Architect',
                                'Lawyer',
                                'Other'
                              ]
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: CustomStyles.black12400),
                                      ))
                                  .toList(),
                              selectedValue:
                                  controller.professionType.value.isEmpty
                                      ? null
                                      : controller.professionType.value,
                              validator: (value) => value == null
                                  ? 'This field is Required'
                                  : null,
                              onChanged: (value) =>
                                  controller.professionType.value = value ?? '',
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: controller.data['Occupation'] ==
                                'Self Employed Professional'
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomDropdownFormField<String>(
                              labelText: 'Industry Type',
                              hintText: 'Select Industry Type',
                              items: [
                                'Manufacturing',
                                'Trading',
                                'Service',
                                'KPO',
                                'BPO',
                                'Software',
                                'Other'
                              ]
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: CustomStyles.black12400),
                                      ))
                                  .toList(),
                              selectedValue:
                                  controller.industryType.value.isEmpty
                                      ? null
                                      : controller.industryType.value,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                              onChanged: (value) =>
                                  controller.industryType.value = value ?? '',
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Professional' ||
                                controller.data['Occupation'] ==
                                    'Self Employed Business')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomdatePicker(
                              controller: controller.dobController,
                              labelText: "Date of Birth",
                            ),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Professional' ||
                                controller.data['Occupation'] ==
                                    'Self Employed Business')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: controller.cinController,
                              labelText: 'CIN Number',
                              hintText: 'Select CIN Number',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'CIN Number is Required'
                                      : null,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        controller: controller.netWorthController,
                        labelText: 'Net Worth',
                        hintText: 'Select Net Worth',
                        validator: (value) => value == null || value.isEmpty
                            ? 'This field is Required'
                            : null,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                  Obx(() => Visibility(
                        visible: controller.data['Occupation'] ==
                                'Loan Against Property'
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: controller.experienceController,
                              labelText: 'Total Experience (Years)',
                              hintText: 'Select Total Experience (Years)',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: controller.data['Occupation'] ==
                                'Loan Against Property'
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: controller.phoneController,
                              labelText: 'Office Phone Number',
                              hintText: 'Select Office Phone Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                } else if (!RegExp(r'^\d{10}$')
                                    .hasMatch(value)) {
                                  return 'Enter a valid 10-digit Mobile Number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Professional' ||
                                controller.data['Occupation'] ==
                                    'Self Employed Business')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller:
                                  controller.grossTurnoverControllerLastYear,
                              labelText: 'Gross Turnover (Last Year)',
                              hintText: 'Select Gross (Last Year)',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Professional' ||
                                controller.data['Occupation'] ==
                                    'Self Employed Business')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: controller.grossTurnoverController2,
                              labelText: 'Gross Turnover 2',
                              hintText: 'Select Gross 2',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Professional' ||
                                controller.data['Occupation'] ==
                                    'Self Employed Business')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: controller.grossTurnoverController3,
                              labelText: 'Gross Turnover 3',
                              hintText: 'Select Gross 3',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: controller.data['Occupation'] ==
                                'Loan Against Property'
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: controller
                                  .grossTurnoverControllerBeforeLastYear,
                              labelText: 'Gross Turnover (before Last Year)',
                              hintText: 'Select Gross (before Last Year)',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: controller.data['Occupation'] ==
                                'Loan Against Property'
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomDropdownFormField<String>(
                              labelText: 'Office Ownership',
                              hintText: 'Select Office Ownership',
                              items: ['Owned', 'Rented']
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: CustomStyles.black12400),
                                      ))
                                  .toList(),
                              selectedValue:
                                  controller.officeOwnership.value.isEmpty
                                      ? null
                                      : controller.officeOwnership.value,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                              onChanged: (value) => controller
                                  .officeOwnership.value = value ?? '',
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomDropdownFormField<String>(
                        labelText: 'Audit Done',
                        hintText: 'Select Audit Done',
                        items: ['Yes', 'No']
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item,
                                      style: CustomStyles.black12400),
                                ))
                            .toList(),
                        selectedValue: controller.auditStatus.value.isEmpty
                            ? null
                            : controller.auditStatus.value,
                        validator: (value) => value == null || value.isEmpty
                            ? 'This field is Required'
                            : null,
                        onChanged: (value) =>
                            controller.auditStatus.value = value ?? '',
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                  Obx(() => Visibility(
                        visible: controller.data['Occupation'] ==
                                'Loan Against Property'
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomDropdownFormField<String>(
                              labelText: 'Ever Defaulted on Loan/Card',
                              hintText: 'Ever Defaulted on Loan/Card',
                              items: ['Yes', 'No']
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: CustomStyles.black12400),
                                      ))
                                  .toList(),
                              selectedValue:
                                  controller.defaultLoanStatus.value.isEmpty
                                      ? null
                                      : controller.defaultLoanStatus.value,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                              onChanged: (value) => controller
                                  .defaultLoanStatus.value = value ?? '',
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Professional' ||
                                controller.data['Occupation'] ==
                                    'Self Employed Business')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomDropdownFormField<String>(
                              labelText: 'Cheque Bounce',
                              hintText: 'Cheque Bounce',
                              items: ['Yes', 'No']
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: CustomStyles.black12400),
                                      ))
                                  .toList(),
                              selectedValue:
                                  controller.chequeBounceStatus.value.isEmpty
                                      ? null
                                      : controller.chequeBounceStatus.value,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                              onChanged: (value) => controller
                                  .chequeBounceStatus.value = value ?? '',
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )),
                  Obx(() => Visibility(
                        visible: (controller.data['Occupation'] ==
                                    'Self Employed Professional' ||
                                controller.data['Occupation'] ==
                                    'Self Employed Business')
                            ? false
                            : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomDropdownFormField<String>(
                              labelText: 'Company Rated',
                              hintText: 'Company Rated',
                              items: ['Yes', 'No']
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item,
                                            style: CustomStyles.black12400),
                                      ))
                                  .toList(),
                              selectedValue:
                                  controller.companyRating.value.isEmpty
                                      ? null
                                      : controller.companyRating.value,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'This field is Required'
                                      : null,
                              onChanged: (value) =>
                                  controller.companyRating.value = value ?? '',
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: controller.onSubmit,
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
