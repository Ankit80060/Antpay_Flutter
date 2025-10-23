import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/account_transfer_controller/account_transfer_benefically_controller.dart';
import 'package:antpay_lite/views/account_transfer/account_transfer_screen.dart';
import 'package:antpay_lite/views/account_transfer/add_beneficial_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class AccountTransferBeneficailScreen extends StatelessWidget {
  AccountTransferBeneficailScreen({super.key});
  final accountTranferController =
      Get.put(AccountTransferBeneficaillyController());

  final List<Color> avatarColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ACCOUNT TRANSFER",
                              style: CustomStyles.black14600),
                          const SizedBox(height: 10),
                          Row(children: [
                            Expanded(
                                flex: 2,
                                child: CustomTextFieldwithoutlabel(
                                  controller:
                                      accountTranferController.searchController,
                                  hintText: "Search Payee",
                                  onChanged: (value) {
                                    accountTranferController
                                        .filterBeneficiaries(value);
                                  },
                                )),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomElevatedButton(
                                width: 100,
                                onPressed: () {
                                  if (!SessionManager().getPayUMpinStatus()) {
                                    accountTranferController.send2FAOtp("SET");
                                    CustomToast.show("Please set your MPIN");
                                  } else {
                                    if (SessionManager()
                                        .getPayUMpinExpiryStatus()!) {
                                      accountTranferController
                                          .send2FAOtp("RESET");
                                      CustomToast.show("MPIN Expired");
                                    } else {
                                      Get.to(() => AddBeneficiaryScreen(),
                                          arguments: accountTranferController
                                              .beneficiaryResponse);
                                    }
                                  }
                                },
                                text: "Add Payee",
                                textstyle: CustomStyles.black12600,
                              ),
                            ))
                          ]),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: List.generate(
                                accountTranferController.types.length * 2 - 1,
                                (i) {
                              if (i.isOdd) {
                                return const SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                        color: Colors.grey, width: 1));
                              }
                              final type =
                                  accountTranferController.types[i ~/ 2];
                              return Expanded(
                                child: Obx(() => InkWell(
                                      onTap: () => accountTranferController
                                          .selectedType.value = type,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Radio<String>(
                                            activeColor: Colors.red,
                                            value: type,
                                            groupValue: accountTranferController
                                                .selectedType.value,
                                            onChanged: (val) =>
                                                accountTranferController
                                                    .selectedType.value = val!,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                          Text(type,
                                              style: CustomStyles.black12400),
                                        ],
                                      ),
                                    )),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text("0.80% convenience fee extra",
                                style: CustomStyles.red10500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Added Beneficiaries", style: CustomStyles.black13500),
                const SizedBox(height: 10),
                Obx(() {
                  if (accountTranferController.isScreenLoading.value) {
                    return const Center(
                      child: Customloader(),
                    );
                  }

                  if (accountTranferController
                      .filteredBeneficiaryList.isEmpty) {
                    return const Center(child: Text("No beneficiaries found"));
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        accountTranferController.filteredBeneficiaryList.length,
                    itemBuilder: (context, index) {
                      var baneficiaryList = accountTranferController
                          .filteredBeneficiaryList[index];

                      return Card(
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                ),
                              ]),
                          child: InkWell(
                            onTap: () {
                              SessionManager()
                                  .addFromScreen("Account Transfer");
                              Get.to(() => AccountTransferScreen(beneficiaryData: baneficiaryList,),
                               );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: avatarColors[
                                        index % avatarColors.length],
                                    child: Text(
                                        baneficiaryList.beneficiaryName![0]
                                            .toUpperCase(),
                                        style: CustomStyles.white14500),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      baneficiaryList.beneficiaryName!
                                              .toUpperCase() ??
                                          '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        baneficiaryList.bankAccountNumber ?? '',
                                        style: CustomStyles.black12400,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        baneficiaryList.ifscCode ?? '',
                                        style: CustomStyles.black12300,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
