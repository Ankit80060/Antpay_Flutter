import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/recharge/recharge_common_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widget/custom_toast_msg.dart';

class DTHPlanListTile2 extends StatefulWidget {
  final String amount;
  final String Planname;
  final String Description;
  final String LastUpdate;

  const DTHPlanListTile2({
    required this.amount,
    required this.Planname,
    required this.Description,
    required this.LastUpdate,
  });

  @override
  State<DTHPlanListTile2> createState() => _DTHPlanListTile2State();
}

class _DTHPlanListTile2State extends State<DTHPlanListTile2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          SessionManager().addTopamount(widget.amount);
          SessionManager().addTopdesc(widget.Description);

          try {
            final rechargeCommonController = Get.find<RechargeCommonController>();
            rechargeCommonController.setAmount(widget.amount);
            rechargeCommonController.setTopUpDescription(widget.Description);
            rechargeCommonController.setTopUpValidity(widget.LastUpdate);
              Get.back();
          } catch (e) {
          

      CustomToast.show("Error loading plan details");
            
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Amount: ${widget.amount}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.tab_title_dark,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Planname: ${widget.Planname}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.tab_title_dark,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description: ${widget.Description}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.tab_title_dark,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'LastUpdate: ${widget.LastUpdate}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.tab_title_dark,
                      fontSize: 10,
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