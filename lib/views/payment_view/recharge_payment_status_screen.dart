import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widget/custom_button.dart';
import '../../res/color_palette.dart';
import '../../utils/routes/routes_name.dart';
import '../../viewmodels/RechargePaymentStatusScreen/recharge_payment_status_controller.dart';

class RechargePaymentStatusScreen extends StatelessWidget {
  RechargePaymentStatusScreen({super.key});

  final controller = Get.put(RechargePaymentStatusController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.redirectToDashboard();
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorPalette.baseBackgroundColor,
        appBar: CustomAppbar(showBackIcon: false),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            surfaceTintColor: Colors.transparent,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/investment_sucess.png'),
                    height: 120,
                    width: 120,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Transaction Successful',
                      textAlign: TextAlign.center,
                      style: CustomStyles.black18400
                          .copyWith(color: Colors.green, fontSize: 20)),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Transaction Id : ${SessionManager().getAntTxnId()}',
                      textAlign: TextAlign.center,
                      style: CustomStyles.black12400.copyWith()),
                  SizedBox(
                    height: 18,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(RoutesName.dashboard);
                    },
                    text: 'Go to Home Page',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
