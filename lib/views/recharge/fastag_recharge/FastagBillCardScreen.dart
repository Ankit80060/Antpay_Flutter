import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart'; // import your custom text field
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/recharge/fastag_recharg_controller/fastag_billcard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';
import '../../../prefrences/session_manager.dart';
import '../../../res/color_palette.dart';

class FastagBillCardScreen extends StatelessWidget {
  // FastagBillCardScreen({super.key});
  final controller = Get.find<FastagBillCardController>();


  @override
  Widget build(BuildContext context) {

    return MainScaffold(
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        ///  Bill Details Card
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.getServiceType() ?? "FastTag",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/icon_bbps.jpg",
                                      height: 30,
                                      width: 80,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                _buildRow(
                                    "Biller Name",
                                    SessionManager().getBillerName() ??
                                        ""),
                                _buildRow(
                                    "Customer Name",
                                    controller.billerRetriveData.value
                                            ?.customerName ??
                                        ""),
                                _buildRow(
                                    "Bill Number",
                                    controller.billerRetriveData.value
                                            ?.billNumber ??
                                        ""),
                                 _buildRow("Bill Amount",
                                    "₹ ${controller.amountController.text}"),
                                _buildRow(
                                    "Bill Date",
                                    controller.billerRetriveData.value
                                            ?.billDate ??
                                        "-"),
                                _buildRow(
                                    "Due Date",
                                    controller
                                            .billerRetriveData.value?.dueDate ??
                                        "-"),
                                _buildRow(
                                    "Bill Period",
                                    controller.billerRetriveData.value
                                            ?.billPeriod ??
                                        "-"),
                              ],
                            ),
                          ),
                        ),

                        ///  Enter Different Amount Card (using CustomTextFieldwithoutlabel)
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Enter Different Amount",
                                    style: CustomStyles.black12600),
                                const SizedBox(height: 6),
                                CustomTextFieldwithoutlabel(
                                  controller: controller.amountController,
                                  hintText: "Enter Amount",
                                  textInputType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputformater: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}')),
                                  ],
                                 
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///  Pay Button
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        controller.clickPayBtn();
                     

                       
                      },
                      text: "Click To Pay",
                    ),
                  ),
                ),
              ],
            ),

            /// Loader
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.03),
                child: const Center(child: Customloader()),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: CustomStyles.black12600),
          Text(value, style: CustomStyles.black12400),
        ],
      ),
    );
  }
}
