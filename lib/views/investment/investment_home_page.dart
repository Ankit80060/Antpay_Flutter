import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widget/image_widget.dart';
import '../../MainScaffold.dart';
import '../../custom_widget/custom_loader.dart';
import '../../viewmodels/investment/investment_home_controler.dart';

class InvestmentHomeView extends StatelessWidget {
  InvestmentHomeView({super.key});
  final InvestmentHomeController controller =
      Get.put(InvestmentHomeController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
       body: SafeArea(
        
        child:  Stack (children: [
         SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                NetworkImageWithLoader(
                  url:
                      "https://antworksmoney.com/apiserver/assets/img/recharge.png",
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Make Investment',
                        style: CustomStyles.black14500.copyWith(fontSize: 15)),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 185,
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: 
                      Obx(() =>  GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.3, // make each cell square-ish
                        ),
                        itemCount: controller.investmentProducts.length,
                        itemBuilder: (context, index) {
                          final item = controller.investmentProducts[index];
                          if(controller.isLoading.value){
                            return SizedBox.shrink();
                          }
                          else if(controller.investmentProducts.isEmpty){
                            return Center(child: Text("No Data Found"));
                          } else{
                          return GestureDetector(
                            onTap: () => controller.handelClickCard(index),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // center vertically
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // center horizontally
                              children: [
                                Image.asset(
                                  item.iconUrlNew!,
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item.investmentProduct!,
                                  style: CustomStyles.dblue12500,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );}
                        },
                      ),),
                    ),
                  ),
                ),
              ],
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
        ])
      ),
    );
  }
}
