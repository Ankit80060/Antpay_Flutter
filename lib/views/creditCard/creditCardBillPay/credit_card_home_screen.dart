import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/res/color_palette.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../MainScaffold.dart';
import '../../../custom_widget/image_widget.dart';

class CreditCardHomeView extends StatelessWidget {
  CreditCardHomeView({super.key});
  // final CreditCardHomeController controller = Get.put(CreditCardHomeController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
       body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                NetworkImageWithLoader(
                  url:
                      "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/CreditCardBanner%2Fcreditcardbanr.png?alt=media&token=0764030e-e565-4aad-84dc-6bdc6a2a4e9c",
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 150,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: ColorPalette.white,
                      surfaceTintColor: ColorPalette.white,
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "Pay your credit card bills and win exciting offers and cashbacks.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'rupee_ford',
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      SessionManager()
                                          .addServicetype("Credit Card");
                                      Get.toNamed(
                                          RoutesName.bharatBillPayTemplateView);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomStyles.bgcolor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Pay Credit Card Bill',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'rupee_ford',
                                        color: CustomStyles.dblue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Frquently Paid Bills',
                        style: CustomStyles.black14500.copyWith(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  elevation: 1,
                  surfaceTintColor: Colors.white,
                  child: ListTile(
                    title: const Text(
                      "ANKIT KUMAR",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    subtitle: const Text(
                      "5363 XXXX XXXX 5998",
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        SessionManager().addServicetype("Credit Card");
                        Get.toNamed(RoutesName.bharatBillPayTemplateView);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC5E6EB),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(
                          color: Color(0xff09466d),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
