// import 'package:antpay_lite/custom_widget/custom_appbar.dart';
// import 'package:antpay_lite/custom_widget/custom_button.dart';
// import 'package:antpay_lite/custom_widget/custom_textfield.dart';
// import 'package:antpay_lite/custom_widget/customstyles.dart';
// import 'package:antpay_lite/viewmodels/wallet_controller.dart/add_money_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import '../../custom_widget/custom_loader.dart';

// class AddMoneyView extends StatelessWidget {
//   final bool? isRechargeScreen;
//   AddMoneyView({super.key, this.isRechargeScreen});
//   var addMoneyController = Get.put(AddMoneyViewController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: CustomAppbar(showBackIcon: true),
//       body: Stack(children: [
//         SafeArea(
//           child: SingleChildScrollView(
//             physics: ClampingScrollPhysics(),
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Card(
//                   surfaceTintColor: Colors.transparent,
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   elevation: 3,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Image.asset(
//                       'assets/images/pay_banner.png',
//                       scale: 1,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Card(
//                   surfaceTintColor: Colors.transparent,
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   elevation: 3,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Load Amount : ", style: CustomStyles.black14400),
//                             isRechargeScreen == false
//                                 ? Spacer()
//                                 : SizedBox(
//                                     width: 50,
//                                   ),
//                             Visibility(
//                               visible: isRechargeScreen == true ? false : true,
//                               child: Text(
//                                   "₹ ${addMoneyController.enteredAmount.value}",
//                                   textAlign: TextAlign.end,
//                                   style: CustomStyles.black14500),
//                             ),
//                             Visibility(
//                               visible: isRechargeScreen == true ? true : false,
//                               child: Expanded(
//                                   child: CustomTextFieldwithoutlabel(
//                                 textInputType: TextInputType.number,
//                                 controller: addMoneyController.controller,
//                                 hintText: "Amount",
//                                 inputformater: [
//                                   FilteringTextInputFormatter.digitsOnly
//                                 ],
//                               )),
//                             ),
//                           ],
//                         ),
//                         Visibility(
//                           visible: isRechargeScreen == true ? true : false,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               _buildAmountSuggestion('₹ 500', 1),
//                               const SizedBox(width: 10.0),
//                               _buildAmountSuggestion('₹ 1000', 2),
//                               const SizedBox(width: 10.0),
//                               _buildAmountSuggestion('₹ 2000', 3),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   surfaceTintColor: Colors.transparent,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Obx(
//                         () => _buildPaymentOption(
//                             'UPI',
//                             addMoneyController.serviceName.value != "ppi-wallet"
//                                 ? "Pay Using UPI"
//                                 : "Add Using UPI",
//                             subtitle: double.parse(addMoneyController
//                                         .upiConvenienceFee.value) >
//                                     0
//                                 ? "${addMoneyController.upiConvenienceFee.value}% convenience fee extra"
//                                 : ""),
//                       ),
//                       Divider(
//                         color: AppColors.black54.withOpacity(0.2),
//                         endIndent: 20,
//                         indent: 20,
//                         height: 0,
//                       ),
//                       Obx(
//                         () => _buildPaymentOption(
//                             'Debit Card',
//                             addMoneyController.serviceName.value != "ppi-wallet"
//                                 ? "Pay Using Debit Card"
//                                 : "Add Using Debit Card",
//                             subtitle:
//                                 addMoneyController.dbConvenienceFeeText.value),
//                       ),
//                       Divider(
//                         color: AppColors.black54.withOpacity(0.2),
//                         endIndent: 20,
//                         indent: 20,
//                         height: 0,
//                       ),
//                       Obx(
//                         () => _buildPaymentOption(
//                             'Credit Card',
//                             addMoneyController.serviceName.value != "ppi-wallet"
//                                 ? "Pay Using Credit Card"
//                                 : "Add Using Credit Card",
//                             subtitle:
//                                 addMoneyController.ccConvenienceFeeText.value),
//                       ),
//                       Divider(
//                         color: AppColors.black54.withOpacity(0.2),
//                         endIndent: 20,
//                         indent: 20,
//                         height: 0,
//                       ),
//                       Obx(
//                         () => _buildPaymentOption(
//                             'Net Banking',
//                             addMoneyController.serviceName.value != "ppi-wallet"
//                                 ? "Pay Using Net Banking"
//                                 : "Add Using Net Banking",
//                             subtitle: addMoneyController
//                                 .netBankingConvenienceFeeText.value),
//                       ),
//                       Divider(
//                         color: AppColors.black54.withOpacity(0.2),
//                         endIndent: 20,
//                         indent: 20,
//                         height: 0,
//                       ),
//                       Obx(
//                         () => _buildPaymentOption(
//                             'Other wallet',
//                             addMoneyController.serviceName.value != "ppi-wallet"
//                                 ? "Pay Using other Wallets"
//                                 : "Add Using other Wallets",
//                             subtitle: addMoneyController
//                                 .otherWalletConvenienceFeeText.value),
//                       ),
//                       if (addMoneyController.serviceName.value != "ppi-wallet") ...[
//                         Divider(
//                           color: AppColors.black54.withOpacity(0.2),
//                           endIndent: 20,
//                           indent: 20,
//                           height: 0,
//                         ),
//                         Obx(
//                           () => _buildPaymentOption('AntPay wallet',
//                               "Pay Using AntPay Wallet",
//                               subtitle: addMoneyController
//                                   .walletConvenienceFeeText.value),
//                         ),
//                       ]
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Card(
//                   surfaceTintColor: Colors.transparent,
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   elevation: 3,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Obx(
//                               () => Text(
//                                   "₹ ${addMoneyController.totalPayAbleAmount.value}",
//                                   style: CustomStyles.black14500),
//                             ),
//                             SizedBox(
//                               height: 5.0,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 clickViewPaymentDetails();
//                               },
//                               child: Text("View Details",
//                                   style: CustomStyles.black13500.copyWith(
//                                       color: AppColors.dblue,
//                                       decoration: TextDecoration.underline,
//                                       decorationColor: AppColors.dblue)),
//                             ),
//                           ],
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.bgcolor,
//                             foregroundColor: AppColors.bgcolor,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                           ),
//                           onPressed: () {
//                             addMoneyController.generatePayUOrder();
//                           },
//                           child: Obx(() => Text(
//                                 addMoneyController.serviceName.value != ""
//                                     ? "Pay Now"
//                                     : "Add Now",
//                                 style: CustomStyles.black13500.copyWith(),
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Card(
//                   surfaceTintColor: Colors.transparent,
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   elevation: 3,
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Payment Gateway Services Provider :",
//                               style: CustomStyles.black14500),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Image.asset(
//                             'assets/images/powered_by_new.png',
//                             scale: 3.2,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Obx(
//           () => addMoneyController.isLoading.value
//               ? Container(
//                   color: Colors.black.withOpacity(0.03),
//                   child: const Center(
//                     child: Customloader(),
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         ),
//       ]),
//     );
//   }

//   Widget _buildPaymentOption(String value, String title, {String? subtitle}) {
//     return Obx(() => RadioListTile<String>(
//           activeColor: Colors.red,
//           contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//           value: value,
//           groupValue: addMoneyController.selectedMethod.value,
//           onChanged: (val) {
//             addMoneyController.handelChangeUpiSelection(val);
//           },
//           title: Text(title, style: CustomStyles.black14400),
//           subtitle: subtitle != null
//               ? Align(
//                   alignment: Alignment.topRight,
//                   child: Text(subtitle,
//                       style:
//                           CustomStyles.black12400.copyWith(color: Colors.red)),
//                 )
//               : null,
//         ));
//   }

//   Widget _buildAmountSuggestion(String amount, int index) {
//     return Obx(() {
//       bool isSelected = addMoneyController.selectedIndex.value == index;

//       return GestureDetector(
//         onTap: () {
//           addMoneyController.selectedIndex.value = index;
//           addMoneyController.controller.text = amount.replaceAll('₹ ', '');
//         },
//         child: Container(
//           height: 30.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.0),
//             border: Border.all(
//               color: isSelected ? Colors.black : Colors.grey,
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 14.0),
//               child: Text(
//                 amount,
//                 style:
//                     isSelected ? CustomStyles.black12400 : CustomStyles.grey125,
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   void clickViewPaymentDetails() {
//     Get.dialog(
//       Dialog(
//         surfaceTintColor: Colors.transparent,
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Payment Details",
//                     style: CustomStyles.black14600,
//                   ),
//                   GestureDetector(
//                     onTap: () => Get.back(),
//                     child: const Icon(Icons.highlight_remove_outlined),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Divider(color: AppColors.black54.withOpacity(0.2)),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text("Amount", style: CustomStyles.black12400),
//                   ),
//                   Expanded(
//                     child: Text(
//                       addMoneyController.enteredAmount.value.isEmpty
//                           ? "₹ 0"
//                           : "₹ ${addMoneyController.enteredAmount.value}",
//                       style: CustomStyles.black12400,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 7),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text("Convenience Fee",
//                         style: CustomStyles.black12400),
//                   ),
//                   Expanded(
//                     child: Obx(() => Text(
//                         "₹ ${addMoneyController.getCommanConvenienceFee.value}",
//                         style: CustomStyles.black12400)),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text("Total", style: CustomStyles.black12600),
//                   ),
//                   Expanded(
//                     child: Obx(() => Text(
//                           addMoneyController.totalPayAbleAmount.value.isEmpty
//                               ? "₹ 0"
//                               : "₹ ${addMoneyController.totalPayAbleAmount.value}",
//                           style: CustomStyles.black12600,
//                         )),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Divider(color: AppColors.black54.withOpacity(0.2)),
//               const SizedBox(height: 10),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: SizedBox(
//                   width: 100,
//                   child: CustomElevatedButton(
//                     onPressed: () => Get.back(),
//                     text: 'Done',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


