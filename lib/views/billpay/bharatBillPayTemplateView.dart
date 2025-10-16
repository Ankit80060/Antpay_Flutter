import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/utils/common_utils.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_autocomplete.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/customstyles.dart';
import '../../model/billpay/BBPSGetBillerBean.dart';
import '../../res/color_palette.dart';
import '../../utils/routes/routes_name.dart';
import '../../viewmodels/billpay_controller/bharat_billpay_controller.dart';

class BharatBillPayTemplateView extends StatelessWidget {
  BharatBillPayTemplateView({super.key});

  final BharatBillPayController controller = Get.put(BharatBillPayController());

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
                  child: 
                       BillerFormFields(context)
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

                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
                          validator: (value) => controller.validateField(
                              value!.trim(), fieldData),
                        ),
                      );
                    },
                  ),
                ),

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
