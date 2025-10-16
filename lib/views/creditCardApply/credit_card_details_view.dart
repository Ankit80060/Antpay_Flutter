
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_appbar.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/image_widget.dart';
import '../../res/color_palette.dart';
import '../../viewmodels/creditCardApply/credit_card_details_controller.dart';

class CrediCradDetailsView extends StatelessWidget {
  CrediCradDetailsView({super.key});

  CreditCardDetailsController controller = Get.put(CreditCardDetailsController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NetworkImageWithLoader(
                    url:
                        "https://antworksmoney.com/app/assets/credit-card-offers/card-banner.png",
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16.0),
             Obx(() {  

              if (controller.loading.value) {
                
                return SizedBox.shrink();
              } else

      if (controller.creditCardDetails.isEmpty) {
        return const Center(child: Text("No card found"));
      } else{
              final card = controller.creditCardDetails.first;

              
              return Card(
                surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
                  Container(
                    
                    decoration: BoxDecoration(
                      color: ColorPalette.blueBackgroundColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: Text(card.creditCardName ?? "",
                          style: CustomStyles.black14600),
                    ),
                  ),
                 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text("Key Features",
                      style:
                          CustomStyles.black14500),
                  const SizedBox(height: 10),
                  ...?card.keyFeatures?.map((feature) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_box_outlined, size: 16, color: Colors.green),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(feature.title ?? "",
                                      style: CustomStyles.black12400),
                                  Text(feature.description ?? "",
                                      style: CustomStyles.black12300.copyWith(fontSize: 11)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 15),
                  Center(
                    child: CustomElevatedButton(
                      
                      onPressed: () {
                        if (card.bankUrl!=null) {
                        CustomUrlLauncher.openUrl(card.bankUrl!);
                          
                        } else {
                          CustomToast.show("Url Not Found");
                        }
                      },
                       text: "APPLY NOW",
                      ),
                    ),
                  
                ],
              ),
            ),
          ],
        ),
      );
  }}),

                 
                ],
              ),
            ),
          ),
          Obx(
            () => controller.loading.value
                ? Container(
                    color: Colors.black.withOpacity(0.03),
                    child: const Center(
                      child: Customloader(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      )),
    );
  }
}
