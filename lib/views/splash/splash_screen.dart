
import 'package:antpay_lite/viewmodels/splash/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
SplashScreen({super.key});
var splashcontroller=Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
       
          children: [
            Spacer(),
          Center(child: Image.asset("assets/images/antpay_logo.png")),
          Spacer(),
           Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset(
                    'assets/images/footer_logo.png',
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
        ],),
      ),
    );
  }
}