import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/views/transaction/components/transction_list.dart';
import 'package:antpay_lite/views/transaction/controller/transction_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_appbar.dart';
import '../../custom_widget/custom_loader.dart';
import '../../res/color_palette.dart';

class TransctionFilterPage extends StatelessWidget {
  TransctionFilterPage({Key? key}) : super(key: key);
  final controller = Get.find<TransctionFilterController>();
  // final TransctionFilterController controller =
  //     Get.put(TransctionFilterController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: Stack(
        children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transaction History', style: CustomStyles.black14600),
              SizedBox(
                height: 16.0,
              ),

              // Dropdown Filter
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white, // white background
                  borderRadius: BorderRadius.circular(5),
                   boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                ),
                
                // height: 75,
                child: Column(children: [
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.grey.shade300), 
                      ),
                      child: DropdownButton<String>(
                        value: controller.filter.value,
                        isExpanded: true, 
                        underline: SizedBox(), 
                        items: controller.filterData
                            .map((f) => DropdownMenuItem<String>(
                                  value: f,
                                  child: Text(
                                    f,
                                    style: CustomStyles.black14400,
                                  ),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) controller.changeFilter(val);
                        },
                      ),
                    ),
                  ),
                  Obx(() {
                    if (controller.filter.value == 'Date Range') {
                      return Column(
                        children: [
                          SizedBox(
                            height: 14.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () =>
                                      {controller.selectDate(context, true)},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                       Obx(() =>  Text(
                                          controller.fromDate.value==null ? "From": AppConstant.formatDate(controller.fromDate.value).toString(),
                                          style: CustomStyles.black14400.copyWith(fontSize: 13),
                                        ),),
                                        Icon(Icons.calendar_today,
                                            color: Colors.grey)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () =>
                                      {controller.selectDate(context, false)},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                     Obx(() =>    Text(
                                         controller.toDate.value == null? "To":AppConstant.formatDate(controller.toDate.value).toString(),
                                          style: CustomStyles.black14400.copyWith(fontSize: 13),
                                        ),),
                                        Icon(Icons.calendar_today,
                                            color: Colors.grey)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
                ]),
              ),

              Expanded(
                child: Obx(() {
                  if (controller.transactions.isEmpty) {
                    
                    return Center(
                      child: Text("No record found for the selected data",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.transactions.length,
                        itemBuilder: (context, index) {
                          final tx = controller.transactions[index];
                          final isSuccess = tx.status == "SUCCESS";
                          return TransactionList(tx: tx, isSuccess: isSuccess);
                        });
                  }
                }),
              ),
            ],
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
