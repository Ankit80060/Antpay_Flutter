import 'package:antpay_lite/custom_widget/custom_url_launcher.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/utils/method_utils.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/views/miniAcc/controller/account_details_controller.dart';
import 'package:antpay_lite/views/miniAcc/controller/virtual_card_controller%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/wallet/CheckUserResponseModelPayu.dart';
import '../../../prefrences/session_manager.dart';
import '../../../utils/routes/routes_name.dart';

class AccountDetailsCard extends StatelessWidget {
  final AccountDetailsController accountController;
  const AccountDetailsCard(
    this.accountController,   {
    Key? key,
  });

  


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var cardData = accountController.cardListData!.isNotEmpty
          ? accountController.cardListData![0]
          : PaymentCard();

      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeInOut,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('A/c Balance',
                            style: CustomStyles.black10400
                                .copyWith(color: AppColors.dblue)),
                        Text('Card No.:',
                            style: CustomStyles.black10400
                                .copyWith(color: AppColors.dblue)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${CommonMethodUtils.currencyFormatter.format((cardData.availableBalance ?? 0) / 100)}',
                            style: CustomStyles.dblue12500),
                        Text(
                            cardData.cardNumber != null
                                ? cardData.cardNumber!.toString()
                                : '--',
                            style: CustomStyles.dblue12500),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('KYC Status',
                            style: CustomStyles.black10400
                                .copyWith(color: AppColors.dblue)),
                        Text('Account Status',
                            style: CustomStyles.black10400
                                .copyWith(color: AppColors.dblue)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            accountController.userRetriveData.value.kycName !=
                                    null
                                ? accountController
                                    .userRetriveData.value.kycName
                                    .toString()
                                : '--',
                            style: CustomStyles.dblue12500),
                        Text(
                            cardData.statusDescription != null
                                ? cardData.statusDescription.toString()
                                : "--",
                            style: CustomStyles.dblue12500),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: AppColors.black54,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            accountController.clickManageTransctionLimit();
                          },
                          child: Text('Manage Transaction Limit',
                              style: CustomStyles.dblue12500),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesName.transctionHistory);
                          },
                          child: Text('Transaction History',
                              style: CustomStyles.dblue12500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesName.walletSetting);
                          },
                          child: Text('Wallet Setting',
                              style: CustomStyles.dblue12500),
                        ),
                        GestureDetector(
                           onTap: () {
                            
                            final vertualCardController = Get.find<VirtualCardController>();
                            vertualCardController.showVirtualCard();

                          },
                          
                          child: Text('Show Card', style: CustomStyles.dblue12500)),
                      ],
                    ),
                    Image.asset(
                      'assets/images/powered_by_new.png',
                      height: 25.0,
                      width: 150.0,
                    ),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
