import 'package:antpay_lite/views/creditLine/widget/apply_now_button.dart';
import 'package:antpay_lite/views/creditLine/widget/credit_line_header.dart';
import 'package:antpay_lite/views/creditLine/widget/credit_line_intro_card.dart';
import 'package:flutter/material.dart';


class CreditLineView extends StatelessWidget {
  const CreditLineView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CreditLineController());

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                surfaceTintColor: Colors.white,
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  background: CreditLineHeader(),
                ),
              ),
            ];
          },
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "AntPay presents Buddy – Credit line for your daily needs.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                const CreditLineIntroCard(),
                ApplyNowButton(
                  onPressed: () =>(){}
                  //  controller.checkFullKycStatus(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
