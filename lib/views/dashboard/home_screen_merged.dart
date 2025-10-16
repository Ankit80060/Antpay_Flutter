// import 'dart:convert';

// import 'package:antpay_lite/custom_widget/custom_loader.dart';
// import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
// import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
// import 'package:antpay_lite/custom_widget/customstyles.dart';
// import 'package:antpay_lite/utils/method_utils.dart';
// import 'package:antpay_lite/utils/routes/routes_name.dart';
// import 'package:antpay_lite/viewmodels/dashboard_controller/home_controller.dart';
// import 'package:antpay_lite/views/recharge/recharge_home_screen.dart';
// import 'package:antpay_lite/views/account_transfer/account_transfer_beneficial_screen.dart';
// import 'package:antpay_lite/views/wallet_tranfer/wallet_transfer_beneficiary_screen.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:easy_stepper/easy_stepper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../prefrences/session_manager.dart';

// // ignore: must_be_immutable
// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   var homecontroller = Get.put(HomeContoller());
//   final List<String> imagePaths = [
//     'assets/images/instant_pay_black.png',
//     'assets/images/to_contact_black.png',
//     'assets/images/to_wallet_black.png',
//     'assets/images/billpay_icon.png',
//   ];
//   final List<String> icon_name = [
//     "Account\nTransfer",
//     "Wallet\nTransfer",
//     "Add\nMoney",
//     "Bill\nPay"
//   ];
//   final List<String> Featurseimagepath = [
//     'assets/images/recharges_db.png',
//     'assets/images/life-insurance.png',
//     'assets/images/motor-insurance.png',
//     'assets/images/health-insurance.png',
//   ];
//   final List<String> featurestext = [
//     "Recharges",
//     "Life\nInsurance",
//     "Car\nInsurance",
//     "Health\nInsurance"
//   ];
//   final List<String> ondcImages = [
//     'assets/images/recharges_db.png',
//     'assets/images/life-insurance.png',
//     'assets/images/motor-insurance.png',
//     'assets/images/health-insurance.png',
//     'assets/images/motor-insurance.png',
//     'assets/images/health-insurance.png',
//     'assets/images/fashion.png',
//     'assets/images/home-kitchen.png',
//     'assets/images/electronics.png',
//     'assets/images/health-wellness.png',
//     'assets/images/grocery.png',
//     'assets/images/beauty-products.png',
//   ];

//   final List<String> ondctext = [
//     "Fashion",
//     "Home & Kitchen",
//     "Electronics",
//     "Health & Wellness",
//     "Grocery",
//     "Beauty & Products"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//             child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Card(
//                   color: CustomStyles.bgcolor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 2.0,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 15),
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4, childAspectRatio: 1.1),
//                       itemCount: 4,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, int index) {
//                         return GestureDetector(
//                           onTap: () {
//                             String encodeData(String data) {
//                               return base64.encode(utf8.encode(data));
//                             }

//                             switch (index) {
//                               case 0:
//                                 if (homecontroller.kycResponseCode == "00") {
//                                   if (homecontroller.kycAccountStatus == "0" ||
//                                       homecontroller.kycAccountStatus ==
//                                           "FULL KYC") {
//                                     Navigator.of(context)
//                                         .push(MaterialPageRoute(
//                                       builder: (context) =>
//                                           AccountTransferBeneficailScreen(),
//                                     ));
//                                   } else {
//                                     String mobile =
//                                         SessionManager().getMobile().toString();
//                                     String url =
//                                         "https://antworksmoney.com/apiserver/PayU_ppi/videokyc?q=${encodeData(mobile)}&md=${encodeData("10")}";
//                                     CustomUrlLauncher.openUrl(url);
//                                   }
//                                 }
//                                 break;
//                               case 1:
//                                 if (homecontroller.kycResponseCode == "00") {
//                                   if (homecontroller.kycAccountStatus == "0" ||
//                                       homecontroller.kycAccountStatus ==
//                                           "FULL KYC") {
//                                     Navigator.of(context)
//                                         .push(MaterialPageRoute(
//                                       builder: (context) =>
//                                           WalletTransferBeneficailScreen(),
//                                     ));
//                                   } else {
//                                     String mobile =
//                                         SessionManager().getMobile().toString();
//                                     String url =
//                                         "https://antworksmoney.com/apiserver/PayU_ppi/videokyc?q=${encodeData(mobile)}&md=${encodeData("10")}";
//                                     CustomUrlLauncher.openUrl(url);
//                                   }
//                                 }
//                                 break;
//                               case 2:
//                                 if (homecontroller.kycResponseCode == "00") {
//                                   Get.toNamed(RoutesName.addMoney,
//                                       arguments: {"isaddmoney": true});
//                                 } else {
//                                   Get.toNamed(RoutesName.miniAccPhonePage);
//                                 }
//                                 break;
//                               case 3:
//                                 Get.toNamed(RoutesName.allBillPay);
//                                 break;
//                             }
//                           },
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 imagePaths[index],
//                                 scale: 3.5,
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 textAlign: TextAlign.center,
//                                 icon_name[index],
//                                 style: CustomStyles.black13500,
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Obx(
//                   () => Visibility(
//                     visible:
//                         homecontroller.isnewuser.value == true ? true : false,
//                     child: Card(
//                       color: CustomStyles.bgcolor,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 12),
//                             child: Obx(
//                               () => EasyStepper(
//                                 alignment: Alignment.topLeft,
//                                 padding: EdgeInsets.only(left: 15, right: 35),
//                                 unreachedStepTextColor: Colors.black87,
//                                 activeStep: homecontroller.activeStep.value,
//                                 lineStyle: const LineStyle(
//                                   lineLength: 60,
//                                   lineType: LineType.normal,
//                                   lineThickness: 2,
//                                   defaultLineColor: Colors.white,
//                                   unreachedLineType: LineType.normal,
//                                 ),
//                                 activeStepTextColor: Colors.black87,
//                                 finishedStepTextColor: Colors.black87,
//                                 showLoadingAnimation: false,
//                                 stepRadius: 7,
//                                 showStepBorder: false,
//                                 steps: [
//                                   EasyStep(
//                                     customStep: CircleAvatar(
//                                       radius: 8,
//                                       backgroundColor: Colors.white,
//                                       child: CircleAvatar(
//                                         radius: 7,
//                                         backgroundColor:
//                                             homecontroller.activeStep.value >= 0
//                                                 ? Colors.red
//                                                 : Colors.white,
//                                       ),
//                                     ),
//                                     customTitle: Text(
//                                       "Register",
//                                       style: CustomStyles.black10400,
//                                       textAlign: TextAlign.center,
//                                       overflow: TextOverflow.visible,
//                                       softWrap: true,
//                                     ),
//                                   ),
//                                   EasyStep(
//                                     customStep: CircleAvatar(
//                                       radius: 8,
//                                       backgroundColor: Colors.white,
//                                       child: CircleAvatar(
//                                         radius: 7,
//                                         backgroundColor:
//                                             homecontroller.activeStep.value >= 1
//                                                 ? Colors.red
//                                                 : Colors.white,
//                                       ),
//                                     ),
//                                     customTitle: Text(
//                                       "Open Min Account",
//                                       style: CustomStyles.black10400,
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   EasyStep(
//                                     customStep: CircleAvatar(
//                                       radius: 8,
//                                       backgroundColor: Colors.white,
//                                       child: CircleAvatar(
//                                         radius: 7,
//                                         backgroundColor:
//                                             homecontroller.activeStep.value >= 2
//                                                 ? Colors.red
//                                                 : Colors.white,
//                                       ),
//                                     ),
//                                     customTitle: Text(
//                                       "Add Funds",
//                                       style: CustomStyles.black10400,
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   EasyStep(
//                                     customStep: CircleAvatar(
//                                       radius: 8,
//                                       backgroundColor: Colors.white,
//                                       child: CircleAvatar(
//                                         radius: 7,
//                                         backgroundColor:
//                                             homecontroller.activeStep.value >= 3
//                                                 ? Colors.red
//                                                 : Colors.white,
//                                       ),
//                                     ),
//                                     customTitle: Text(
//                                       "Start Online Transaction(s)",
//                                       style: CustomStyles.black10400,
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   EasyStep(
//                                     customStep: CircleAvatar(
//                                       radius: 8,
//                                       backgroundColor: Colors.white,
//                                       child: CircleAvatar(
//                                         radius: 7,
//                                         backgroundColor:
//                                             homecontroller.activeStep.value >= 4
//                                                 ? Colors.red
//                                                 : Colors.white,
//                                       ),
//                                     ),
//                                     customTitle: Text(
//                                       "KYC & ATM Card",
//                                       style: CustomStyles.black10400,
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   EasyStep(
//                                     customStep: CircleAvatar(
//                                       radius: 8,
//                                       backgroundColor: Colors.white,
//                                       child: CircleAvatar(
//                                         radius: 7,
//                                         backgroundColor:
//                                             homecontroller.activeStep.value >= 5
//                                                 ? Colors.red
//                                                 : Colors.white,
//                                       ),
//                                     ),
//                                     customTitle: Text(
//                                       "Add on cards",
//                                       style: CustomStyles.black10400,
//                                       textAlign: TextAlign.center,
//                                       overflow: TextOverflow.visible,
//                                       softWrap: true,
//                                     ),
//                                   ),
//                                 ],
//                                 onStepReached: (index) =>
//                                     homecontroller.onStepReached(index),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 160,
//                             child: PageView(
//                               physics: BouncingScrollPhysics(),
//                               controller: homecontroller.pageController,
//                               onPageChanged: (index) =>
//                                   homecontroller.activeStep(index),
//                               children: [
//                                 CardWidget(
//                                   title: "Register",
//                                   texts: const [
//                                     'Get coupon worth ₹500.00',
//                                     'Claim after registering phone number',
//                                   ],
//                                   buttonText: "Claim",
//                                   onPressed: () {},
//                                   cardColor: CustomStyles.bgcolor,
//                                   titleColor: Colors.red,
//                                   buttonColor: Colors.red,
//                                 ),
//                                 CardWidget(
//                                   title: "Open Min Account",
//                                   texts: const [
//                                     'Instant Activation  (✓) Free Virtual Card',
//                                     'No minimum balance requirements',
//                                     'Discount offers available on 200+ brands',
//                                     'Accidental insurance of INR 1 Lakh',
//                                   ],
//                                   buttonText: 'Open Now',
//                                   onPressed: () {},
//                                   cardColor: CustomStyles.bgcolor,
//                                   titleColor: Colors.red,
//                                   buttonColor: Colors.red,
//                                 ),
//                                 CardWidget(
//                                   title: "Add Funds",
//                                   texts: const [
//                                     'Add funds using payment gateway or UPI',
//                                     'Lowest transaction charges',
//                                     "Start online transaction(s)",
//                                   ],
//                                   buttonText: "Add Funds",
//                                   onPressed: () {},
//                                   cardColor: CustomStyles.bgcolor,
//                                   titleColor: Colors.red,
//                                   buttonColor: Colors.red,
//                                 ),
//                                 CardWidget(
//                                   title: "Start Online Transaction(s)",
//                                   texts: const [
//                                     'E-Commerce Transactions using virtual card',
//                                     'Online bill payments',
//                                     'Offers on 200+ brands',
//                                     'All transactions secured by 2FA',
//                                   ],
//                                   buttonText: "Start Now",
//                                   onPressed: () {},
//                                   cardColor: CustomStyles.bgcolor,
//                                   titleColor: Colors.red,
//                                   buttonColor: Colors.red,
//                                 ),
//                                 CardWidget(
//                                   title: "KYC & ATM Card",
//                                   texts: const [
//                                     'Get full KYC done to unlock all features',
//                                     '10x transaction limit',
//                                     'UPI payments',
//                                     'Bank transfer',
//                                   ],
//                                   buttonText: 'Do it now',
//                                   onPressed: () {},
//                                   cardColor: CustomStyles.bgcolor,
//                                   titleColor: Colors.red,
//                                   buttonColor: Colors.red,
//                                 ),
//                                 CardWidget(
//                                   title: 'Add on cards',
//                                   texts: const [
//                                     'Add an ATM card available for POS transactions',
//                                     'Accepted at all merchant locations',
//                                     'Withdraw cash from any ATM',
//                                     'Get metro card for use at all metro stations',
//                                   ],
//                                   buttonText: 'Do it now',
//                                   onPressed: () {},
//                                   cardColor: CustomStyles.bgcolor,
//                                   titleColor: Colors.red,
//                                   buttonColor: Colors.red,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Obx(
//                   () => Visibility(
//                     visible:
//                         homecontroller.isCardShow.value == true ? true : false,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5, bottom: 5),
//                           child: Text('Mini A/c Details',
//                               style: CustomStyles.black14600),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.2),
//                                   blurRadius: 5,
//                                 ),
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: GestureDetector(
//                               child: AnimatedSwitcher(
//                                   duration: const Duration(milliseconds: 500),
//                                   switchInCurve: Curves.easeInOut,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Name',
//                                               style: CustomStyles.dblue12300),
//                                           Text('A/c Balance',
//                                               style: CustomStyles.dblue12300),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                               "${homecontroller.userRetriveData.value.firstName} "
//                                                       " ${homecontroller.userRetriveData.value.lastName}" ??
//                                                   "",
//                                               style: CustomStyles.dblue12500),
//                                           Text(
//                                             "${CommonMethodUtils.currencyFormatter.format((homecontroller.cardDetails?.availableBalance ?? 0) / 100)}",
//                                             style: CustomStyles.dblue12500,
//                                           )
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 7,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Card Number',
//                                               style: CustomStyles.dblue12300),
//                                           Text('Valid Upto',
//                                               style: CustomStyles.dblue12300),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                               homecontroller.cardDetails
//                                                       ?.cardNumber ??
//                                                   "",
//                                               style: CustomStyles.dblue12500),
//                                           Text(
//                                               CommonMethodUtils.formatValidUpto(
//                                                   homecontroller.cardDetails
//                                                           ?.uniqueNumberValidity ??
//                                                       ""),
//                                               style: CustomStyles.dblue12500),
//                                         ],
//                                       ),
//                                       Divider(
//                                         height: 30,
//                                         color: CustomStyles.dblue,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () {
//                                               Get.toNamed(RoutesName
//                                                   .transactionLimitPage);
//                                             },
//                                             child: Text(
//                                                 'Manage Transaction Limit',
//                                                 style: CustomStyles.dblue12500),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {
//                                               Get.toNamed(
//                                                   RoutesName.transctionHistory);
//                                             },
//                                             child: Text('Transaction History',
//                                                 style: CustomStyles.dblue12500),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () {
//                                               Get.toNamed(
//                                                   RoutesName.cardOfferScreen);
//                                             },
//                                             child: Text('Card Offer',
//                                                 style: CustomStyles.dblue12500),
//                                           ),
//                                           GestureDetector(
//                                             child: Text('View Virtual Card',
//                                                 style: CustomStyles.dblue12500),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       Image.asset(
//                                         'assets/images/powered_by_new.png',
//                                         scale: 2.5,
//                                       ),
//                                     ],
//                                   )),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 homecontroller.announcementList.isEmpty
//                     ? const SizedBox()
//                     : const SizedBox(
//                         height: 10,
//                       ),
//                 homecontroller.announcementList.isEmpty
//                     ? const SizedBox()
//                     : Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.2),
//                                 blurRadius: 5,
//                               ),
//                             ]),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Obx(
//                             () => CarouselSlider(
//                               carouselController:
//                                   homecontroller.carouselSliderController,
//                               options: CarouselOptions(
//                                 height: 50,
//                                 enlargeCenterPage: true,
//                                 autoPlay: true,
//                                 aspectRatio: 16 / 9,
//                                 autoPlayCurve: Curves.fastOutSlowIn,
//                                 enableInfiniteScroll: true,
//                                 autoPlayAnimationDuration:
//                                     const Duration(milliseconds: 800),
//                                 viewportFraction: 1,
//                                 onPageChanged: (index, reason) {
//                                   homecontroller.updateIndex(index);
//                                 },
//                               ),
//                               items: homecontroller.announcementList.map((data) {
//                                 return Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/announcement.png",
//                                       scale: 4,
//                                       color: Colors.black,
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text(
//                                       data.title!,
//                                       style: CustomStyles.black14400,
//                                     ),
//                                   ],
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 180,
//                   child: Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 5,
//                           ),
//                         ]),
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: PageView.builder(
//                             allowImplicitScrolling: false,
//                             pageSnapping: false,
//                             controller: homecontroller.pageController,
//                             itemCount:
//                                 (homecontroller.pageData.length / 6).ceil(),
//                             onPageChanged: (index) {
//                               homecontroller.currentIndex.value = index;
//                             },
//                             itemBuilder: (context, pageIndex) {
//                               final startIndex = pageIndex * 6;
//                               final endIndex = (startIndex + 6) >
//                                       homecontroller.pageData.length
//                                   ? homecontroller.pageData.length
//                                   : startIndex + 6;

//                               final pageItems = homecontroller.pageData
//                                   .sublist(startIndex, endIndex);

//                               return GridView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 padding: const EdgeInsets.all(10),
//                                 gridDelegate:
//                                     const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3,
//                                   childAspectRatio: 1.6,
//                                   mainAxisSpacing: 10,
//                                   crossAxisSpacing: 10,
//                                 ),
//                                 itemCount: pageItems.length,
//                                 itemBuilder: (context, index) {
//                                   final item = pageItems[index];
//                                   return GestureDetector(
//                                     onTap: () {
//                                       homecontroller
//                                           .handelClickCard(startIndex + index);
//                                     },
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           child: Image.asset(
//                                             item["image"]!,
//                                             width: 30,
//                                             height: 35,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 5),
//                                         Text(
//                                           item["title"]!,
//                                           style: CustomStyles.dblue12500,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                         Obx(() => Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(
//                                 (homecontroller.pageData.length / 6).ceil(),
//                                 (index) => Container(
//                                   width: 8.0,
//                                   height: 8.0,
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 4.0),
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: homecontroller.currentIndex.value ==
//                                             index
//                                         ? Colors.blueAccent
//                                         : Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                             )),
//                         const SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text('Top Features', style: CustomStyles.black14600),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Card(
//                   color: CustomStyles.bgcolor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 2.0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4, childAspectRatio: 1.1),
//                       itemCount: 4,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, int index) {
//                         return GestureDetector(
//                           onTap: () {
//                             if (index == 0) {
//                               Navigator.of(
//                                 context,
//                               ).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => RechargeHomeScreen(),
//                                 ),
//                               );
//                             }
//                           },
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Image.asset(
//                                 Featurseimagepath[index],
//                                 scale: 3.5,
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 textAlign: TextAlign.center,
//                                 featurestext[index],
//                                 style: CustomStyles.dblue12500,
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text('Top Recommendations', style: CustomStyles.black14600),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Obx(() {
//                   if (homecontroller.bannerList.isEmpty) {
//                     return Container(
//                       height: 160,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           'No offers available at the moment.',
//                           style: CustomStyles.black12400
//                               .copyWith(color: AppColors.black54),
//                         ),
//                       ),
//                     );
//                   }

//                   return CarouselSlider(
//                     carouselController: homecontroller.carouselSliderController,
//                     options: CarouselOptions(
//                       aspectRatio: 16 / 8,
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: true,
//                       autoPlay: true,
//                       enableInfiniteScroll: true,
//                       autoPlayAnimationDuration:
//                           const Duration(milliseconds: 800),
//                       viewportFraction: 1,
//                       onPageChanged: (index, reason) {
//                         homecontroller.updateIndex(index);
//                       },
//                     ),
//                     items: homecontroller.bannerList.map((data) {
//                       return GestureDetector(
//                         onTap: () {
//                           if (data.app_page == "credit_card_apply") {
//                             CustomUrlLauncher.openUrl(
//                                 "https://cconboarding.aubank.in/auccself/#/landing?utm_source=dsa&utm_medium=display-agg&utm_campaign=credit-card-dsa-campaign-989198-357428-Ant01");
//                           } else if (data.app_page == "Home Loan") {
//                             CustomUrlLauncher.openUrl(
//                                 "https://antworksmoney.com/app/offers-img/c19d81ec1732573ab327b945c9b17224.jpg");
//                           } else if (data.app_page == "Online Shopping") {
//                             CustomUrlLauncher.openUrl("https://www.miicart.in");
//                           } else if (data.app_page == "Travel") {
//                             CustomUrlLauncher.openUrl("https://anttravel.in/");
//                           } else if (data.app_page == "Investment") {
//                             CustomToast.show("Comming Soon...");
//                           }
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: CachedNetworkImage(
//                             imageUrl: data.banner_img ?? '',
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) => const Center(
//                               child: Customloader(),
//                             ),
//                             errorWidget: (context, url, error) => Container(
//                               color: Colors.grey.shade300,
//                               alignment: Alignment.center,
//                               child: const Icon(Icons.broken_image,
//                                   size: 60, color: Colors.grey),
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 }),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text('ONDC ecommerce', style: CustomStyles.black14600),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Card(
//                   color: CustomStyles.bgcolor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 2.0,
//                   child: SizedBox(
//                     height: 100,
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 6,
//                         physics: const BouncingScrollPhysics(),
//                         shrinkWrap: true,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               if (index == 0) {
//                                 CustomUrlLauncher.openUrl(
//                                   "https://www.miicart.in/fashion",
//                                 );
//                               } else if (index == 1) {
//                                 CustomUrlLauncher.openUrl(
//                                   "https://www.miicart.in/home-kitchen",
//                                 );
//                               } else if (index == 2) {
//                                 CustomUrlLauncher.openUrl(
//                                   "https://www.miicart.in/electronics",
//                                 );
//                               } else if (index == 3) {
//                                 CustomUrlLauncher.openUrl(
//                                   "https://www.miicart.in/grocery",
//                                 );
//                               } else if (index == 4) {
//                                 CustomUrlLauncher.openUrl(
//                                   "https://www.miicart.in/beauty-care",
//                                 );
//                               } else if (index == 5) {
//                                 CustomUrlLauncher.openUrl(
//                                   "https://www.miicart.in/health-wellness",
//                                 );
//                               }
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   ondcImages[index],
//                                   scale: 3,
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   child: Text(
//                                     ondctext[index],
//                                     style: CustomStyles.dblue12500,
//                                     maxLines: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Antpay Offer',
//                   style: CustomStyles.black14600,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Obx(() {
//                   if (homecontroller.offersData.isEmpty) {
//                     return Container(
//                       height: 160,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           'No offers available at the moment.',
//                           style: CustomStyles.black12400
//                               .copyWith(color: AppColors.black54),
//                         ),
//                       ),
//                     );
//                   }
//                   return CarouselSlider(
//                     carouselController: homecontroller.carouselSliderController,
//                     options: CarouselOptions(
//                       aspectRatio: 16 / 8,
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: true,
//                       autoPlay: true,
//                       enableInfiniteScroll: true,
//                       autoPlayAnimationDuration:
//                           const Duration(milliseconds: 800),
//                       viewportFraction: 1,
//                       onPageChanged: (index, reason) {
//                         homecontroller.updateIndex(index);
//                       },
//                     ),
//                     items: homecontroller.offersData.map((data) {
//                       return GestureDetector(
//                         onTap: () {
//                           homecontroller.clickOfferBanner(data);
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: CachedNetworkImage(
//                             imageUrl: data.offerBannerImg ?? '',
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) => const Center(
//                               child: Customloader(),
//                             ),
//                             errorWidget: (context, url, error) => Container(
//                               color: Colors.grey.shade300,
//                               alignment: Alignment.center,
//                               child: const Icon(Icons.broken_image,
//                                   size: 60, color: Colors.grey),
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 }),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text('Financial Recommendation',
//                     style: CustomStyles.black14600),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 CarouselSlider(
//                   carouselController: homecontroller.carouselSliderController,
//                   options: CarouselOptions(
//                     aspectRatio: 16 / 8,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enlargeCenterPage: true,
//                     autoPlay: true,
//                     enableInfiniteScroll: true,
//                     autoPlayAnimationDuration:
//                         const Duration(milliseconds: 800),
//                     viewportFraction: 1,
//                     onPageChanged: (index, reason) {
//                       homecontroller.updateIndex(index);
//                     },
//                   ),
//                   items: [
//                     "https://firebasestorage.googleapis.com/v0/b/antpay-ae6e5.appspot.com/o/financial_banner%2FFinancial_Recommendation_1_Bandhan.png?alt=media&token=6c4ac6e6-045f-4f14-969c-07832e004c6a",
//                     "assets/images/financial_banner.png",
//                   ].map((url) {
//                     return GestureDetector(
//                       onTap: () {
//                         CustomUrlLauncher.openUrl(
//                           "https://www.bandhanlife.com/online-plans/simple-redirection?partnerCode=4r1d2ltsj504dnul2bnieeqd9h&schemeCode=ARMP0000120",
//                         );
//                       },
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: url.startsWith("assets/")
//                             ? Image.asset(
//                                 url,
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               )
//                             : CachedNetworkImage(
//                                 imageUrl: url,
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 placeholder: (context, url) => const Center(
//                                   child: Customloader(),
//                                 ),
//                                 errorWidget: (context, url, error) => Container(
//                                   color: Colors.grey.shade300,
//                                   alignment: Alignment.center,
//                                   child: const Icon(Icons.broken_image,
//                                       size: 60, color: Colors.grey),
//                                 ),
//                               ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text('Game Zone', style: CustomStyles.black14600),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Obx(() {
//                   if (homecontroller.gamezonebannerList.isEmpty) {
//                     return Container(
//                       height: 160,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           'No Game Zone available at the moment.',
//                           style: CustomStyles.black12400
//                               .copyWith(color: AppColors.black54),
//                         ),
//                       ),
//                     );
//                   }

//                   return CarouselSlider(
//                     carouselController: homecontroller.carouselSliderController,
//                     options: CarouselOptions(
//                       aspectRatio: 16 / 8,
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: true,
//                       autoPlay: true,
//                       enableInfiniteScroll: true,
//                       autoPlayAnimationDuration:
//                           const Duration(milliseconds: 800),
//                       viewportFraction: 1,
//                       onPageChanged: (index, reason) {
//                         homecontroller.updateIndex(index);
//                       },
//                     ),
//                     items: homecontroller.gamezonebannerList.map((data) {
//                       return GestureDetector(
//                         onTap: () {
//                           CustomUrlLauncher.openUrl(
//                               "https://10114.play.gamezop.com/");
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: CachedNetworkImage(
//                             imageUrl: data.banner ?? '',
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) => const Center(
//                               child: Customloader(),
//                             ),
//                             errorWidget: (context, url, error) => Container(
//                               color: Colors.grey.shade300,
//                               alignment: Alignment.center,
//                               child: const Icon(Icons.broken_image,
//                                   size: 60, color: Colors.grey),
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 }),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Obx(() {
//                   return homecontroller
//                           .antpaySocialController.antpaysociallist.isEmpty
//                       ? SizedBox()
//                       : Text(
//                           'Antpay Social',
//                           style: CustomStyles.black14600,
//                         );
//                 }),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Obx(() {
//                   return homecontroller
//                           .antpaySocialController.antpaysociallist.isEmpty
//                       ? SizedBox()
//                       : SizedBox(
//                           child: ListView.builder(
//                           itemCount: 5,
//                           scrollDirection: Axis.vertical,
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemBuilder: (context, position) {
//                             final item = homecontroller.antpaySocialController
//                                 .antpaysociallist[position];
//                             return GestureDetector(
//                               onTap: () {
//                                 CustomUrlLauncher.openUrl(item.url);
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.only(bottom: 10),
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.2),
//                                       blurRadius: 5,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       height: 70,
//                                       width: 70,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: CachedNetworkImage(
//                                           imageUrl: item.img,
//                                           fit: BoxFit.cover,
//                                           placeholder: (context, url) =>
//                                               const Center(
//                                             child: SizedBox(
//                                               height: 20,
//                                               width: 20,
//                                               child: Customloader(),
//                                             ),
//                                           ),
//                                           errorWidget: (context, url, error) =>
//                                               Container(
//                                             color: Colors.grey.shade300,
//                                             alignment: Alignment.center,
//                                             child: const Icon(Icons.broken_image,
//                                                 color: Colors.grey, size: 40),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             item.title,
//                                             style: CustomStyles.black12600,
//                                             maxLines: 2,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                           const SizedBox(height: 5),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 item.website,
//                                                 style: CustomStyles.black10400,
//                                               ),
//                                               const SizedBox(width: 10),
//                                               Text(
//                                                 item.createdAt,
//                                                 style: CustomStyles.black10400,
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ));
//                 })
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                 top: BorderSide(
//                   color: CustomStyles.dblue,
//                   width: 1.5,
//                 ),
//                 bottom: const BorderSide(
//                   color: Colors.red,
//                   width: 1.5,
//                 ),
//               ),
//             ),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//               Text('Follow Us on', style: CustomStyles.black14600),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         CustomUrlLauncher.openUrl(homecontroller.urlFacebook);
//                       },
//                       child: Image.asset(
//                         'assets/images/facebook.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         CustomUrlLauncher.openUrl(homecontroller.urlTwitter);
//                       },
//                       child: Image.asset(
//                         'assets/images/twitterx.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         CustomUrlLauncher.openUrl(homecontroller.urlLinkedln);
//                       },
//                       child: Image.asset(
//                         'assets/images/linkedin.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Text('ANTWORKS FINANCIAL BUDDY TECHNOLOGIES PVT.LTD.',
//                   style: CustomStyles.black10600),
//               Text(
//                 'CIN: U67200HR2012PTC046705 |  Email ID: support@antworksmoney.com\nCopyrights © Antworks Money 2017-2024.All Rights Reserved.',
//                 textAlign: TextAlign.center,
//                 style: CustomStyles.black8400,
//               ),
//             ]),
//           ),
//         ])),
//       ),
//     );
//   }
// }

// class CardWidget extends StatelessWidget {
//   final String title;
//   final List<String> texts;
//   final String buttonText;
//   final VoidCallback onPressed;
//   final Color cardColor;
//   final Color titleColor;
//   final Color buttonColor;

//   const CardWidget({
//     super.key,
//     required this.title,
//     required this.texts,
//     required this.buttonText,
//     required this.onPressed,
//     this.cardColor = Colors.white,
//     this.titleColor = Colors.red,
//     this.buttonColor = Colors.red,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
//       child: Card(
//         color: cardColor,
//         surfaceTintColor: cardColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(6.0),
//         ),
//         elevation: 5.0,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: CustomStyles.red13600),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: texts
//                           .map((txt) => Padding(
//                                 padding: const EdgeInsets.only(bottom: 5),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                         CupertinoIcons.check_mark_circled,
//                                         size: 10),
//                                     const SizedBox(width: 5),
//                                     Expanded(
//                                       child: Text(
//                                         txt,
//                                         style: CustomStyles.black8400,
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ))
//                           .toList(),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: onPressed,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: buttonColor,
//                       minimumSize: const Size(0, 25.0),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0, vertical: 5),
//                     ),
//                     child: Text(buttonText, style: CustomStyles.white10500),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


