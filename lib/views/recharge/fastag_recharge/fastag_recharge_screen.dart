import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_autocomplete.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/billpay/BBPSGetBillerBean.dart';
import 'package:antpay_lite/utils/common_utils.dart';
import 'package:antpay_lite/viewmodels/recharge/fastag_recharg_controller/fastag_recharge_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';
import '../../../custom_widget/custom_loader.dart';
import '../../../res/color_palette.dart';

class FastagRechargeScreen extends StatelessWidget {
  FastagRechargeScreen({super.key});

  final FastagRechargeController controller =
      Get.put(FastagRechargeController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child:  Column(children: [
             BillerFormFields(context),
     Obx(
        () => controller.isLoading.value
            ? Container(
                color: Colors.black.withOpacity(0.03),
                child: const Center(
                  child: Customloader(),
                ),
              )
            : const SizedBox.shrink(),
      ),

        ],)


        
          
        ),
      
    );
  }

  /// ------------------- Biller Form Fields -------------------
  Form BillerFormFields(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row: Service Name + Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.getServiceType() ?? "Fastag",
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

                const SizedBox(height: 20),
                // _buildHeader('Biller Name'),

                AutocompleteDropdown<Billers>(
                  items: controller.billerData,
                  hintText: "Search biller name",
                  displayString: (c) => c.billerName!,
                  onSelected: (selection) {
                    controller.handelBillerSellection(selection);
                  },
                  itemBuilder: (item) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child:
                        Text(item.billerName!, style: CustomStyles.black12300),
                  ),
                ),

                // Dynamic Input Fields from API
                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.inpuFieldBillerData.length,
                      itemBuilder: (context, index) {
                        var fieldData = controller.inpuFieldBillerData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CustomTextField(
                            hintText: "Enter ${fieldData.paramName!}",
                            controller: controller.textControllers[index],
                            labelText: fieldData.paramName ?? '',
                            length: int.parse(fieldData.maxLength!),
                            textInputType:
                                controller.getKeyboardType(fieldData.dataType),
                            minLength: int.parse(fieldData.minLength!),
                            validator: (value) =>
                                controller.validateField(value, fieldData),
                          ),
                        );
                      },
                    )),

                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*.45,
                    child: CustomElevatedButton(
                      onPressed: controller.fetchDetailsBtn,
                     
                       text: "Fetch Details",
                       
                      ),
                  ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ------------------- Reusable Widgets -------------------
  Widget _buildHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
