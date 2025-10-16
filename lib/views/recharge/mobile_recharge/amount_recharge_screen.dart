import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/recharge/amount_recharge_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

class AmountRechargeScreen extends StatelessWidget {
  // const AmountRechargeScreen({super.key});
  final AmountMobileRechargeController controller =
      Get.find<AmountMobileRechargeController>();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: Obx(
          () => AbsorbPointer(
            absorbing: controller.loading.value,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20.0),
                                Text(
                                  "Mobile Number",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: ColorPalette.tab_title_dark,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    controller.getMobileNumber(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, left: 5.0),
                                  child: Text(
                                    controller.getCompanyName(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7.0),
                                Text(
                                  "Select Operator",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: ColorPalette.tab_title_dark,
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        gapPadding: 0.5,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        gapPadding: 0.5,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 0.0),
                                    ),
                                    hint: Text(controller.operatorName.isEmpty
                                        ? 'No operators available'
                                        : 'Select Operator'),
                                    value: controller.operator.value.isEmpty
                                        ? null
                                        : controller.operator.value,
                                    validator: (value) => value == null
                                        ? 'Operator Required'
                                        : null,
                                    items: controller.operatorName
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        controller.setOperator(value);
                                        SessionManager().addOperator(value);
                                        SessionManager().addOperatorCode(
                                            controller.operatorCodeMap[value] ??
                                                '');
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 7.0),
                                Text(
                                  "Select Circle",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: ColorPalette.tab_title_dark,
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        gapPadding: 0.5,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        gapPadding: 0.5,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 0.0),
                                    ),
                                    hint: Text(controller.circleName.isEmpty
                                        ? 'No circles available'
                                        : 'Select Circle'),
                                    value: controller.circle.value.isEmpty
                                        ? null
                                        : controller.circle.value,
                                    validator: (value) => value == null
                                        ? 'Circle Required'
                                        : null,
                                    items: controller.circleName
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        controller.setCircle(value);
                                        final circleCode = controller
                                            .circleCodeMap.entries
                                            .firstWhere(
                                                (entry) => entry.value == value,
                                                orElse: () =>
                                                    const MapEntry('', ''))
                                            .key;
                                        SessionManager().addValue(circleCode);
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 7.0),
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: ColorPalette.tab_title_dark,
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  child: TextFormField(
                                    controller: controller.amountController,
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Amount',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gapPadding: 0.5,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gapPadding: 0.5,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 0.0),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, right: 6.0, bottom: 5.0),
                                        child: TextButton(
                                          onPressed: () {
                                            Get.toNamed(RoutesName
                                                .mobileRechargePlanScreen);
                                          },
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.black,
                                            backgroundColor: ColorPalette
                                                .proceed_btn_bg_color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            'VIEW PLANS',
                                            style: TextStyle(
                                              color:
                                                  ColorPalette.tab_title_dark,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.errorMessage.value = '';
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an amount';
                                      }
                                      if (double.tryParse(value) == null ||
                                          double.parse(value) <= 0) {
                                        return 'Enter a valid amount';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                SizedBox(
                                  width: double.infinity,
                                  child: CustomElevatedButton(
                                    onPressed: () {
                                      if (controller
                                          .amountController.text.isEmpty) {
                                        controller.errorMessage.value =
                                            'Please enter an amount';
                                        CustomToast.show(
                                            controller.errorMessage.value);
                                        return;
                                      }
                                      if (double.tryParse(controller
                                                  .amountController.text) ==
                                              null ||
                                          double.parse(controller
                                                  .amountController.text) <=
                                              0) {
                                        controller.errorMessage.value =
                                            'Enter a valid amount';
                                        CustomToast.show(
                                            controller.errorMessage.value);
                                        return;
                                      }
                                      if (controller.operator.value.isEmpty) {
                                        controller.errorMessage.value =
                                            'Please select an operator';
                                        CustomToast.show(
                                            controller.errorMessage.value);
                                        return;
                                      }
                                      if (controller.circle.value.isEmpty) {
                                        controller.errorMessage.value =
                                            'Please select a circle';
                                        CustomToast.show(
                                            controller.errorMessage.value);
                                        return;
                                      }
                                      // SessionManager().addNumber(
                                      //     controller.amountController.text);
                                      Get.toNamed(RoutesName.addMoney,
                                          arguments: {
                                            "isaddmoney": false,
                                            "amount": controller
                                                .amountController.text,
                                            "fromPage": "recharges"
                                          });
                                    },
                                    text: 'Proceed to Recharge',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (controller.errorMessage.value.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            controller.errorMessage.value,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14),
                          ),
                        ),
                    ],
                  ),
                ),
                if (controller.loading.value)
                  Center(
                    child: Image.asset(
                      'assets/images/loader_image.gif',
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
