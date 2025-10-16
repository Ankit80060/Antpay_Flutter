
// reward history ListTile
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MobilePlanListTile2 extends StatefulWidget {
  final String amount;
  final String Description;
  final String Validity;
  // final VoidCallback? onTap;

  const MobilePlanListTile2(
      {
        required this.amount,
        required this.Description,
        required this.Validity
        // required this.onTap
      });

  @override
  State<MobilePlanListTile2> createState() => _MobilePlanListTile2State();
}

class _MobilePlanListTile2State extends State<MobilePlanListTile2> {

  @override
  Widget build(BuildContext context) {

  final controller = Get.find<MobileRechargePlanController>();

    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          SessionManager().addTopamount(widget.amount);
          SessionManager().addTopdesc(widget.Description);
          SessionManager().addTopvalidity(widget.Validity);

          controller.setAmount(widget.amount);
          controller.setTopUpDescription(widget.Description);
          controller.setTopUpValidity(widget.Validity);
          
          Navigator.pop(context, widget.amount);

          // setState(() {

          // });
        },
        child: Container(
          // padding: EdgeInsets.all(8.0),
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
                  child: Text('Amount : ${
                      widget.amount}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color:ColorPalette.tab_title_dark,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Description : ${widget.Description}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color:ColorPalette.tab_title_dark,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Validity : ${widget.Validity}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color:ColorPalette.tab_title_dark,
                      fontSize: 12,
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