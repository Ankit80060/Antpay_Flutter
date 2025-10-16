import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antpay_lite/custom_widget/custom_appbar.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/custom_textfield.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../custom_widget/customstyles.dart';
import '../../res/color_palette.dart';
import '../../utils/routes/routes_name.dart';
import '../../viewmodels/billpay_controller/biller_table_controller.dart';

class BillerTableDetailsPage extends StatelessWidget {
  BillerTableDetailsPage({super.key});
  

  final BillerTableController controller = Get.find<BillerTableController>();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
     
      body: Obx(
        () => Stack(children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Card(
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Row: Service Name + Logo
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.getServiceType() ?? "",
                                style: const TextStyle(
                                  fontFamily: 'rupee_ford',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
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
                          _buildRow("Biller Name",
                              SessionManager().getBillerName() ?? ""),

                          _buildRow(
                              "Customer Name :",
                              controller
                                      .billerRetriveData.value!.customerName ??
                                  ""),
                          _buildRow(
                              "Bill Number :",
                              controller.billerRetriveData.value!.billNumber ??
                                  ""),
                          _buildRow("Bill Amount :",
                              "₹ ${controller.billerRetriveData.value!.billAmount}"),
                          _buildRow(
                              "Bill Date :",
                              controller.billerRetriveData.value!.billDate ??
                                  ""),
                          _buildRow(
                              "Due Date :",
                              controller.billerRetriveData.value!.dueDate ??
                                  ""),
                          _buildRow(
                              "Bill Period :",
                              controller.billerRetriveData.value!.billPeriod ??
                                  ""),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              length: 6,
                              textInputType: TextInputType.number,
                              labelText: "Enetr Custom Amount",
                              controller: controller.customAmountController,
                              hintText: "Enter custom amount")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
          if (controller.isLoading.value)
            Container(
              color: Colors.black.withOpacity(0.03),
              child: const Center(
                child: Customloader(),
              ),
            )
        ]),
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
