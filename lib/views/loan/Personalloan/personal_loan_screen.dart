import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_date_picker.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/place_model/city_model.dart';
import 'package:antpay_lite/model/place_model/occupation_model.dart';
import 'package:antpay_lite/model/place_model/qualification_model.dart';
import 'package:antpay_lite/model/place_model/state_model.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/loan/Personalloan/personalloan_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class PersonalLoanForm extends StatelessWidget {
  PersonalLoanForm({Key? key}) : super(key: key);

  final PersonalLoanController controller = Get.put(PersonalLoanController());
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
                    controller: controller.firstNameController,
                    labelText: "Full Name",
                    hintText: "Full Name",
                    validator: (v) =>
                        v!.isEmpty ? "This field is required" : null,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: controller.emailController,
                    labelText: "Email Id",
                    hintText: "Email Id",
                    // keyboardType: TextInputType.emailAddress,
                    validator: (v) => v!.isEmpty
                        ? "This field is required"
                        : !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                                .hasMatch(v)
                            ? "Invalid email format"
                            : null,
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: controller.mobileController,
                    labelText: "Mobile Number",
                    hintText: "number",
                    // keyboardType: TextInputType.phone,
                    validator: (v) => v!.isEmpty
                        ? "This field is required"
                        : v.length != 10
                            ? "Mobile number must be 10 digits"
                            : null,
                  ),
                  const SizedBox(height: 5),
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Gender",
                        hintText: "Select Gender",
                        items: controller.genderList.map((g) {
                          return DropdownMenuItem<String>(
                            value: g,
                            child: Text(g, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue: controller.selectedGender.value.isEmpty
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
                  const SizedBox(height: 5),
                  CustomdatePicker(
                    controller: controller.dobController,
                    labelText: "Date of Birth",
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ),
                  const SizedBox(height: 5),
                  Obx(() => CustomDropdownFormField<String>(
                        labelText: "Marital Status",
                        hintText: "Select Marital Status",
                        items: controller.maritalList.map((g) {
                          return DropdownMenuItem<String>(
                            value: g,
                            child: Text(g, style: CustomStyles.black12400),
                          );
                        }).toList(),
                        selectedValue: controller
                                .selectedselectedMaritalStatus.value.isEmpty
                            ? null
                            : controller.selectedselectedMaritalStatus.value,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please Select a Marital Status";
                          }
                          return null;
                        },
                        onChanged: (val) => controller
                            .selectedselectedMaritalStatus.value = val!,
                      )),
                  const SizedBox(height: 5),
                  Obx(() => CustomDropdownFormField<StateList>(
                        labelText: "Select State",
                        hintText: "Select State",
                        selectedValue: controller.selectedState.value,
                        items: controller.stateList.map((state) {
                          return DropdownMenuItem<StateList>(
                            value: state,
                            child: Text(state.state ?? "NA",
                                style: CustomStyles.black12400),
                          );
                        }).toList(),
                        onChanged: (val) {
                          controller.selectedState.value = val;
                          controller.initCityList(val?.code);
                        },
                        validator: (val) =>
                            val == null ? "Please Select a State" : null,
                      )),
                  const SizedBox(height: 5),
                  Obx(() => CustomDropdownFormField<City>(
                        labelText: "Select City",
                        hintText: "Select City",
                        selectedValue: controller.selectedCity.value,
                        items: controller.cityList.map((city) {
                          return DropdownMenuItem<City>(
                            value: city,
                            child: Text(city.cityName ?? "NA",
                                style: CustomStyles.black12400),
                          );
                        }).toList(),
                        onChanged: (val) {
                          controller.selectedCity.value = val as City?;
                        },
                        validator: (val) =>
                            val == null ? "Please Select a City" : null,
                      )),
                  const SizedBox(height: 5),
                  Obx(() => CustomDropdownFormField<QualificationList>(
                        labelText: "Education",
                        hintText: "Select Education",
                        items: controller.qualificationList.map((edu) {
                          return DropdownMenuItem<QualificationList>(
                            value: edu,
                            child: Text(
                              edu.qualification ?? '',
                              style: CustomStyles.black12400,
                            ),
                          );
                        }).toList(),
                        selectedValue: controller.selectedEducation.value,
                        validator: (val) =>
                            val == null ? "Please Select Education" : null,
                        onChanged: (val) =>
                            controller.selectedEducation.value = val,
                      )),
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final data = {
                            "firstName": controller.firstNameController.text,
                            "lastName": controller.lastNameController.text,
                            "email": controller.emailController.text,
                            "mobile": controller.mobileController.text,
                            "dob": controller.dobController.text,
                            "gender": controller.selectedGender.value,
                            "maritalStatus":
                                controller.selectedselectedMaritalStatus.value,
                            "state":
                                controller.selectedState.value?.state ?? "",
                            "city":
                                controller.selectedCity.value?.cityName ?? "",
                            "qualification": controller
                                    .selectedEducation.value?.qualification ??
                                "",
                            "Occupation": controller
                                    .selectedOccupation.value?.occupation ??
                                "",
                            "loanType": loanType,
                            "loanName": loanName,
                          };

                          if (loanType == "Business Loan") {
                            Get.toNamed(
                              RoutesName.otherdetailsscreen,
                              arguments: data,
                            );
                          } else {
                            Get.toNamed(
                              RoutesName.occupationdetails,
                              arguments: data,
                            );
                          }
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
