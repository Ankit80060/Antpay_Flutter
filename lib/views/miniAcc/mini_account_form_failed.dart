
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniAccountFormFailed extends StatefulWidget {
  const MiniAccountFormFailed({super.key});

  @override
  _MiniAccountFormFailedState createState() => _MiniAccountFormFailedState();
}

class _MiniAccountFormFailedState extends State<MiniAccountFormFailed> {

  @override
  Widget build(BuildContext context) {
     final args = Get.arguments as Map<String, dynamic>?;
    final message = args?['message'] ?? "Something went wrong!";
     final errormessage = args?['err_msg'] ?? "Something went wrong!";
    return Scaffold(
    
      body: Center(
        child: Container(height: 350,alignment: Alignment.center,
           margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300)
                     
                    ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  width: double.infinity,
                  height: 120.0,
              
                  image: AssetImage("assets/images/investment_fail.png"),
                ),
                const SizedBox(height: 20.0),
                
                 Text(
                 message,
                  style:CustomStyles.red16500,
                  textAlign: TextAlign.center,
                ), const SizedBox(height: 5),
                 Text(
                 errormessage,
                  style:CustomStyles.black13500,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18.0),
              SizedBox(width: 200,
                child: CustomElevatedButton(onPressed: (){
                Get.back();
                },text: "Try again",bgColor: Colors.red,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


