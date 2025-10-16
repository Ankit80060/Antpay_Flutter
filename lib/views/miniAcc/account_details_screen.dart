import 'dart:ui';

import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/utils/method_utils.dart';
import 'package:antpay_lite/views/miniAcc/controller/account_details_controller.dart';
import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/views/miniAcc/components/account_details_card.dart';
import 'package:antpay_lite/views/miniAcc/components/services_card.dart';
import 'package:antpay_lite/views/miniAcc/controller/virtual_card_controller%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_loader.dart';
import '../../model/wallet/CheckUserResponseModelPayu.dart';
import '../../prefrences/session_manager.dart';
import '../../utils/routes/routes_name.dart';

class AccountDetailsPages extends StatelessWidget {
  AccountDetailsPages({super.key});

  var accountcontroller = Get.put(AccountDetailsController());
   var vertualCardController = Get.put(VirtualCardController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
       body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountDetailsCard(
                  accountcontroller,
                ),
                Row(
                  children: [
                    Obx(() {
                      var cardData = accountcontroller.cardListData!.isNotEmpty
                          ? accountcontroller.cardListData![0]
                          : PaymentCard();

                      return _balanceCard(
                          title: "Mini A/c Balance",
                          text: CommonMethodUtils.currencyFormatter
                              .format((cardData.availableBalance ?? 0) / 100));
                    }),
                    SizedBox(
                      width: 12,
                    ),
                    Obx(
                      () => _balanceCard(
                        // onTap: accountcontroller.handelCardClick(),
                        title: "AntPay Coins Balance",
                        text: accountcontroller.coinsBalance.value,
                        icon: Image.asset(
                          'assets/images/coins.png',
                          scale: 3.0,
                        ),
                        forwardIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 2,
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Money to Your Mini A/c",
                          style: CustomStyles.black14500,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        CustomTextField(
                            //     inputformater: [
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            textInputType: TextInputType.number,
                            length: 5,
                            onChanged: (value) =>
                                accountcontroller.chnageAmountField(value),
                            controller: accountcontroller.amountController,
                            // maxlenth: 5,
                            labelText: 'Amount',
                            hintText: "Enter amount"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Wrap(
                                spacing: 12,
                                children:
                                    accountcontroller.amounts.map((amount) {
                                  return ChoiceChip(
                                      showCheckmark: false,
                                      backgroundColor: Colors.white,
                                      label: Text("₹ $amount"),
                                      selected:
                                          accountcontroller.selectedAmount ==
                                              amount,
                                      onSelected: (bool selected) {
                                        selected
                                            ? accountcontroller
                                                .setAmount(amount)
                                            : null;
                                      },
                                      selectedColor: AppColors.bgcolor,
                                      labelStyle:
                                          CustomStyles.black14500.copyWith(
                                        color:
                                            accountcontroller.selectedAmount ==
                                                    amount
                                                ? AppColors.black54
                                                : Colors.black,
                                      ));
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => Align(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.bgcolor,
                                    foregroundColor: AppColors.bgcolor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 10),
                                  ),
                                  onPressed: accountcontroller.selectedAmount >
                                          0
                                      ? () {
                                          if (accountcontroller
                                                  .selectedAmount >=
                                              10) {
                                            SessionManager()
                                                .addServicetype("ppi Wallet");
                                            Get.toNamed(RoutesName.addMoney,
                                                arguments: {
                                                  "isaddmoney": false,
                                                  "fromPage": "ppi-wallet",
                                                  "amount": accountcontroller
                                                      .selectedAmount
                                                });
                                          } else {
                                            CustomToast.show(
                                                "Please enter at least ₹ 10");
                                          }
                                        }
                                      : null,
                                  child: Text(
                                    "Add",
                                    style: CustomStyles.black13500.copyWith(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Services', style: CustomStyles.black14600),
                const SizedBox(
                  height: 5,
                ),
                ServicesCard(
                  accountcontroller: accountcontroller,
                  itemLength: accountcontroller.servicesimagepath.length,
                  images: accountcontroller.servicesimagepath,
                  texts: accountcontroller.servicestext,
                  type: "Service",
                  onItemTap: (index, type) {
                    if (index == 0 || index == 2) {
                      CustomToast.show("Comming Soon");
                      return;
                    } else if (index == 1) {
                      Get.toNamed(RoutesName.rechargeHomeScreen);
                      return;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Bill Payments', style: CustomStyles.black14600),
                const SizedBox(
                  height: 5,
                ),
                Obx(() {
                  if (accountcontroller.billIconData.isEmpty) {
                    return Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 2.0,
                      child: SizedBox(
                        height: 80,
                        child: Center(
                          child: Text(
                            "No Bill Payment Services Available",
                            style: CustomStyles.black12400
                                .copyWith(color: AppColors.black54),
                          ),
                        ),
                      ),
                    );
                  }
                  return ServicesCard(
                    accountcontroller: accountcontroller,
                    itemLength: accountcontroller.billIconData.length,
                    images: accountcontroller.billIconData
                        .map((e) => e.service_categories_img_new ?? "")
                        .toList(),
                    texts: accountcontroller.billIconData
                        .map((e) => e.Service_Name ?? "")
                        .toList(),
                    type: "bill",
                    onItemTap: (index, type) {
                      accountcontroller.handelBillPaymentCardClick(
                          accountcontroller.billIconData[index].Service_Name);

                       },
                  );
                }),
              ],
            ),
          ),
        ),
        Obx(
          () => accountcontroller.isLoading.value
              ? Container(
                  color: Colors.black.withOpacity(0.03),
                  child: const Center(
                    child: Customloader(),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ]),
    );
  }

  Widget _balanceCard({
    required String title,
    required String text,
    Image? icon,
    Icon? forwardIcon,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (title == "AntPay Coins Balance") {
            accountcontroller.handelCardClick();
            return;
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          // elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomStyles.grey103
                      .copyWith(color: AppColors.black54, fontSize: 11.0),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    if (icon != null) ...[
                      icon,
                      const SizedBox(width: 12),
                    ],
                    // space between icon & text
                    Expanded(
                      child: Text(
                        text,
                        style: CustomStyles.black16600,
                      ),
                    ),
                    if (forwardIcon != null) ...[
                      forwardIcon,
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
