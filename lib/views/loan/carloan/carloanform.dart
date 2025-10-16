import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_dropdown.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/utils/common_utils.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/loan/Car_loan_controller/CarLoanformController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class CarLoanForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final CarLoanFormController controller = Get.put(CarLoanFormController());

  CarLoanForm({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final imagePath = args?['image'] ?? 'assets/images/ic_car_insurance.png';
    final loanType = args?['loanType'] ?? 'Car Loan';
    final loanName = args?['loanName']?.toString() ?? '2';

    return MainScaffold(
     
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Card(
                  color: ColorPalette.white,
                  surfaceTintColor: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.loanRequirementController,
                          hintText: "Loan Requirement",
                          labelText: "Loan Requirement",
                          validator: (v) {
                            if (v == null || v.isEmpty) return "Required";
                            if (!RegExp(r'^[1-9]\d*$').hasMatch(v)) {
                              return "Enter valid number";
                            }
                            int value = int.parse(v);
                            if (value < 5000) return "Min 5000 required";
                            if (value > 50000000) {
                              return "Max 50000000 allowed";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Identified Car?",
                          style: CustomStyles.black12400,
                        ),
                        const SizedBox(height: 5),
                        Obx(() => Row(
                              children: [
                                _buildRadio("Yes", true,
                                    controller.isCarIdentified.value, (val) {
                                  controller.isCarIdentified.value = val!;
                                }),
                                _buildRadio("No", false,
                                    controller.isCarIdentified.value, (val) {
                                  controller.isCarIdentified.value = val!;
                                }),
                              ],
                            )),
                        const SizedBox(height: 5),
                        Text(
                          "Car Type",
                          style: CustomStyles.black12400,
                        ),
                        const SizedBox(height: 5),
                        Obx(() => Row(
                              children: [
                                _buildRadio(
                                    "New Car", true, controller.isNewCar.value,
                                    (val) {
                                  controller.isNewCar.value = val!;
                                }),
                                _buildRadio("Used Car", false,
                                    controller.isNewCar.value, (val) {
                                  controller.isNewCar.value = val!;
                                }),
                              ],
                            )),
                        const SizedBox(height: 5),
                        Text(
                          "Select Brand",
                          style: CustomStyles.black12400,
                        ),
                        // TypeAheadField<String>(
                        //   textFieldConfiguration: TextFieldConfiguration(
                        //     controller: controller.brandController,
                        //     decoration: _inputDecoration("Select Car Brand"),
                        //     style: CustomStyles.black12400,
                        //     cursorColor: Colors.red,
                        //     cursorWidth: 1,
                        //   ),
                        //   suggestionsCallback: (pattern) async {
                        //     return await controller.searchBrand(pattern);
                        //   },
                        //   itemBuilder: (context, suggestion) {
                        //     return Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Text(
                        //         suggestion,
                        //         style: const TextStyle(
                        //             fontSize: 12, fontWeight: FontWeight.w300),
                        //       ),
                        //     );
                        //   },
                        //   onSuggestionSelected: (suggestion) async {
                        //     controller.selectedBrand.value = suggestion;
                        //     controller.brandController.text = suggestion;
                        //     await controller.initBrandModel(suggestion);
                        //   },
                        // ),
                        const SizedBox(height: 5),
                        Text(
                          "Select Model",
                          style: CustomStyles.black12400,
                        ),
                        const SizedBox(height: 10),
                        // TypeAheadField<String>(
                        //   textFieldConfiguration: TextFieldConfiguration(
                        //     controller: controller.modelController,
                        //     decoration: _inputDecoration("Select Car Model"),
                        //     style: CustomStyles.black12400,
                        //   ),
                        //   suggestionsCallback: (pattern) async {
                        //     return await controller.searchModel(pattern);
                        //   },
                        //   itemBuilder: (context, suggestion) {
                        //     return Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Text(
                        //         suggestion,
                        //         style: const TextStyle(
                        //             fontSize: 12, fontWeight: FontWeight.w300),
                        //       ),
                        //     );
                        //   },
                        //   onSuggestionSelected: (suggestion) {
                        //     controller.selectedModel.value = suggestion;
                        //     controller.modelController.text = suggestion;
                        //   },
                        //   noItemsFoundBuilder: (context) => const Padding(
                        //     padding: EdgeInsets.all(8.0),
                        //     child: Text("No models found"),
                        //   ),
                        // ),
                        Obx(() => CustomDropdownFormField<String>(
                              hintText: "Select State",
                              labelText: "Select State",
                              items: controller.stateList
                                  .map((state) => DropdownMenuItem<String>(
                                        value: state.numStateCd,
                                        child: Text(
                                          state.txtState,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              selectedValue:
                                  controller.selectedState.value?.numStateCd,
                              validator: (val) => val == null || val.isEmpty
                                  ? "State required"
                                  : null,
                              onChanged: (val) {
                                if (val != null) {
                                  controller.onStateSelected(val);
                                }
                              },
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            )),
                        const SizedBox(height: 5),
                        Obx(() => CustomDropdownFormField<String>(
                              hintText: "Select RTO",
                              labelText: "Select RTO",
                              items: controller.rtoList
                                  .map((r) => DropdownMenuItem(
                                        value: r,
                                        child: Text(
                                          r,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              selectedValue: controller.selectedRto.value,
                              validator: (val) => val == null || val.isEmpty
                                  ? "Required"
                                  : null,
                              onChanged: (val) =>
                                  controller.selectedRto.value = val,
                            )),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final validationError = controller.validateForm();
                              if (validationError != null) {
                                CustomToast.show("Error");
                                return;
                              }
                              final data = {
                                "amount":
                                    controller.loanRequirementController.text,
                                "carBrand": controller.brandController.text,
                                "carModel": controller.modelController.text,
                                "carType":
                                    controller.isNewCar.value ? 'New' : 'Used',
                                "rto": controller.selectedRto.value ?? "",
                                "identifiedTheCar":
                                    controller.isCarIdentified.value
                                        ? 'Yes'
                                        : 'No',
                                "state":
                                    controller.selectedState.value?.txtState ??
                                        "",
                                "stateCode": controller
                                        .selectedState.value?.numStateCd ??
                                    "",
                                "loanType": loanType,
                                "loanName": loanName,
                              };
                              print("Form Data: $data");
                              Get.toNamed(
                                RoutesName.carloanscreen,
                                arguments: data,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CommonUtils.toColor("c5e6eb"),
                            minimumSize: const Size(double.infinity, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            "Proceed",
                            style:
                                TextStyle(color: CommonUtils.toColor("6f6e6e")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (controller.loading.value)
              Center(
                child: Image.asset(
                  "assets/images/loader_image.gif",
                  width: 50,
                  height: 50,
                ),
              ),
          ],
        );
      }),
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        hintText: hint,
        hintStyle: CustomStyles.grey123
            .copyWith(color: AppColors.black54, fontSize: 12),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black54),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.black54.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.dblue.withOpacity(0.8)),
        ),
      );

  Widget _buildRadio(String label, bool value, bool groupValue,
      ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<bool>(
          value: value,
          groupValue: groupValue,
          activeColor: Colors.red,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
