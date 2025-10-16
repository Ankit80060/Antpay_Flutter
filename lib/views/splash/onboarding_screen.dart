import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.offAllNamed(RoutesName.login);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var pageDecoration = PageDecoration(
      bodyTextStyle: CustomStyles.black15600,
      pageColor: CustomStyles.bgcolor,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      backgroundColor: CustomStyles.bgcolor,
      body: SafeArea(
        child: Column(
          children: [
         const   SizedBox(
              height: 80,
            ),
            Image.asset("assets/images/antpay_logo.png"),
          const  SizedBox(
              height: 80,
            ),
            Expanded(
              child: IntroductionScreen(
                key: introKey,
                globalBackgroundColor: CustomStyles.bgcolor,
                allowImplicitScrolling: true,
                dotsDecorator: DotsDecorator(
                  size: const Size.square(10.0),
                  activeSize: const Size(20.0, 10.0),
                  activeColor: CustomStyles.dblue,
                  color: Colors.black26,
                  spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                  // activeShape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(25.0)),
                ),

                pages: [
                  PageViewModel(
                    title: "",
                    body: "Open mini account\n #your daily use account",
                    image: _buildImage('img_intro_1.png'),
                    decoration: pageDecoration,
                  ),
                  PageViewModel(
                    title: "",
                    body:
                        "Get instant AntPay digital card with offer on 200+ brands",
                    image: _buildImage('img_intro_2.png'),
                    decoration: pageDecoration,
                  ),
                  PageViewModel(
                    title: "",
                    body: "Take hassle free loans at AntPay",
                    image: _buildImage('img_intro_3.png'),
                    decoration: pageDecoration,
                  ),
                  PageViewModel(
                    title: "",
                    body: "Insure yourself and your family",
                    image: _buildImage('img_intro_4.png'),
                    decoration: pageDecoration.copyWith(
                      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                      bodyFlex: 2,
                      imageFlex: 3,
                      safeArea: 100,
                    ),
                  ),
                  PageViewModel(
                    title: "",
                    body: "Start Saving Money",
                    image: _buildImage('img_intro_5.png'),
                    decoration: pageDecoration.copyWith(
                      bodyFlex: 6,
                      imageFlex: 6,
                      safeArea: 80,
                    ),
                  ),
                  PageViewModel(
                    title: "",
                    body:
                        "Managing finances has never been so easy\n #neo bank for all",
                    image: _buildImage('img_intro_6.png'),
                    decoration: pageDecoration.copyWith(
                      bodyFlex: 6,
                      imageFlex: 6,
                      safeArea: 80,
                    ),
                  ),
                ],
                onDone: () => _onIntroEnd(context),
                onSkip: () => _onIntroEnd(context),
                showSkipButton: true,
                skipOrBackFlex: 0,
                nextFlex: 0,
                showBackButton: false,
  onChange: (index) {
    if (index == 5) { 
      _onIntroEnd(context);
    }
  },

                back: Icon(
                  Icons.arrow_back,
                  color: CustomStyles.dblue,
                ),
                skip: Text('Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomStyles.dblue,
                    )),
                next: Text('Next',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomStyles.dblue,
                    )),
                done: Text('Done',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomStyles.dblue,
                    )),

                curve: Curves.fastLinearToSlowEaseIn,
                controlsMargin: const EdgeInsets.all(16),
                controlsPadding: kIsWeb
                    ? const EdgeInsets.all(12.0)
                    : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
