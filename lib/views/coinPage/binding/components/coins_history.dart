import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../custom_widget/no_record_found.dart';
import '../controller/coin_history_controller.dart';

class CoinsHistoryTable extends StatelessWidget {
     var coincontroller = Get.find<CoinHistoryPageController>();


  @override
  Widget build(BuildContext context) {
    return 
     Obx(() {
      if (coincontroller.isLoading.value) {
            return const Center(child: Customloader());
          }

          if (coincontroller.coinHistory.isEmpty) {
            return Center(child: SizedBox(
              height: 180,width: double.infinity,child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: NoRecordFoundWidget(Icons.history, "No Coin History", "You have no coin transactions yet."))));
          }
      
      return SingleChildScrollView(
        child: 
          

          
        
         Container(
          margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
              padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
          child: Column(
            children: [
               Text(
                    
                    'AntPay Coins History',
                    style: CustomStyles.black14500.copyWith(fontSize: 16.0),
                  ),
                  SizedBox(height: 10,),
              Table(
                border: TableBorder.all(color: AppColors.bordercolor, width: 1),
                columnWidths: const {
                  0: FlexColumnWidth(2), // Date
                  1: FlexColumnWidth(1), // Amount
                  2: FlexColumnWidth(4), // Description
                },
                children: [
                  // Header Row
                  // TableRow(
                  //   decoration: BoxDecoration(color: Colors.grey.shade300),
                  //   children: const [
                  //     Padding(
                  //       padding: EdgeInsets.all(8.0),
                  //       child: Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.all(8.0),
                  //       child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold)),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.all(8.0),
                  //       child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                  //     ),
                  //   ],
                  // ),
                  // Dynamic rows
                  ...coincontroller.coinHistory.map(
                    (item) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.createdAt!,style: CustomStyles.black12400.copyWith(color: AppColors.black54,fontSize: 11.0 ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${item.transactionType=='Cr'  ? "+" :  item.transactionPoint != '0'?"-": ""}${item.transactionPoint}",
                            style: CustomStyles.black12400.copyWith(color: item.transactionType=='Cr'
                                  ? Colors.green
                                  : item.transactionPoint != '0' && item.transactionType!='Cr'
                                      ? Colors.red
                                      : AppColors.black54,
                                      fontSize: 11.0 )
                            
                            
                            
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.reference1!,style: CustomStyles.black12400.copyWith(color: AppColors.black54,fontSize: 11.0 ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
      ));
     });
  }
}
