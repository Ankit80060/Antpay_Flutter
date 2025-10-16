import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MainScaffold.dart';
import '../../custom_widget/custom_appbar.dart';
import '../../custom_widget/custom_autocomplete.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/customstyles.dart';
import '../../model/billpay/getBillers.dart';
import '../../prefrences/session_manager.dart';
import '../../res/color_palette.dart';
import '../../utils/common_utils.dart';
import '../../viewmodels/billpay_controller/post_paid_fragment_controler.dart';

class PostPaidFragment extends StatelessWidget {
  const PostPaidFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostPaidController());

    return MainScaffold(
     
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              surfaceTintColor: Colors.transparent,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    AutocompleteDropdown<ServiceResultModel>(
                      items: controller.billerServiceData,
                      hintText: "Search biller name",
                      displayString: (c) => c.Operator_Name!,
                      onSelected: (selection) {
                        controller.handelBillerSellection(selection);
                      },
                      itemBuilder: (item) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        child: Text(item.Operator_Name!,
                            style: CustomStyles.black12300),
                      ),
                    ),

                    Obx(() => Visibility(
                          visible: controller.billerOperatorData.value != null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              // _buildHeader(controller.billerOperatorData.value?.numberTag ?? ""),
                              Form(
                                key: controller.formKey,
                                child: CustomTextField(
                                  length: 10,
                                  controller: controller.numberController,
                                  labelText: controller
                                      .billerOperatorData.value?.numberTag,
                                  hintText:
                                      "Enter ${controller.billerOperatorData.value?.numberTag}",
                                  validator: (value) =>
                                      controller.checkVaklidation(value),
                                ),
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*.45,
                        child: CustomElevatedButton(
                          onPressed: () {
                            controller.fetchBillerDetails();
                          },
                          text: "Fetch Details",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
      ]),
    );
  }

  Widget _buildHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
