import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/recharge/dth_recharge_controller/dth_recharge_controller.dart';
import 'package:antpay_lite/viewmodels/recharge/recharge_common_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';

// Define your controller logic here
class DthRechargeView extends StatelessWidget {
  const DthRechargeView({super.key});

  @override
  Widget build(BuildContext context) {
    final DthRechargeController controller = Get.put(DthRechargeController());
    // final AmountMobileRechargeController amountController =
    //     Get.put(AmountMobileRechargeController());
    final commonController = Get.find<RechargeCommonController>();

    return MainScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 2,
                margin: EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                'DTH Recharge',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: const Color(0xFF424242),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            SizedBox(height: 8.0),
                            Text(
                              'Select Circle',
                              style: TextStyle(
                                color: ColorPalette.tab_title_dark,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => Container(
                            height: 40,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                  gapPadding: 0.5,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.blue),
                                  gapPadding: 0.5,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0,
                                  horizontal: 10.0,
                                ),
                              ),
                              hint: Text('Enter Circle'),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              value: controller.circle.value.isEmpty
                                  ? null
                                  : controller.circle.value,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Circle Required'
                                      : null,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: controller.circleName
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  controller.circle.value = value;
                                  controller.selectedCircle.value = value;
                                  var circleData = controller.circleDataList[
                                      controller.circleName.indexOf(value)];
                                  SessionManager().addValue(
                                      circleData.circle_code.toString());
                                  }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            SizedBox(height: 8.0),
                            Text(
                              'Select Operator',
                              style: TextStyle(
                                color: ColorPalette.tab_title_dark,
                                // fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => Container(
                            height: 40,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                  gapPadding: 0.5,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.blue),
                                  gapPadding: 0.5,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0,
                                  horizontal: 10.0,
                                ),
                              ),
                              hint: Text('Enter Operator'),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              value: controller.operator.value.isEmpty
                                  ? null
                                  : controller.operator.value,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Operator Required'
                                      : null,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: controller.operatorName
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  controller.operator.value = value;
                                  controller.selectedOperator.value = value;
                                  final index =
                                      controller.operatorName.indexOf(value);
                                  if (index >= 0 &&
                                      index <
                                          controller.operatorDataList.length) {
                                    var op = controller.operatorDataList[index];
                                    if (op.operator_code != null) {
                                      SessionManager().addOperatorCode(
                                          op.operator_code.toString());
                                       } else {
                                      CustomToast.show(
                                          "Operator code not available");
                                    }
                                    } else {
                                    CustomToast.show(
                                        "Invalid operator selection");
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'DTH Number',
                              style: TextStyle(
                                color: ColorPalette.tab_title_dark,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: controller.dthController.value,
                            keyboardType: TextInputType.number,
                            maxLength: 12,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: 'Enter DTH Number',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                                gapPadding: 0.5,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.blue),
                                gapPadding: 0.5,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0,
                                horizontal: 10.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'Amount',
                              style: TextStyle(
                                color: ColorPalette.tab_title_dark,
                                //fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            controller: commonController.numberController.value,
                            decoration: InputDecoration(
                              hintText: '₹0',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                                gapPadding: 0.5,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.blue),
                                gapPadding: 0.5,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              hintStyle: TextStyle(fontSize: 12),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4.0,
                                  right: 8.0,
                                  bottom: 4.0,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (!controller.validateInputs()) return;
                                    Get.toNamed(RoutesName.dthPlanTabView);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor:
                                        ColorPalette.proceed_btn_bg_color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    'View Plans',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: ColorPalette.tab_title_dark,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                final amountText = commonController
                                    .numberController.value.text
                                    .trim();

                                if (amountText.isEmpty) {
                                  CustomToast.show(
                                      "Please select a plan before proceeding");
                                  return;
                                }

                                Get.toNamed(RoutesName.addMoney, arguments: {
                                  "isaddmoney": false,
                                  "amount": amountText,
                                  "fromPage": "dth"
                                });
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:
                                    ColorPalette.proceed_btn_bg_color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                'Recharge',
                                style: TextStyle(
                                  color: ColorPalette.tab_title_dark,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
