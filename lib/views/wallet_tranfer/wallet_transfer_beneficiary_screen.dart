import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/wallet_transfer_controller.dart/wallet_transfer_beneficiary_controller.dart';
import 'package:antpay_lite/views/account_transfer/account_transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class WalletTransferBeneficailScreen extends StatelessWidget {
  WalletTransferBeneficailScreen({
    super.key,
  });
  final WalletTranferController =
      Get.put(WalletTranferBeneficaillyController());

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
                          Text("Wallet TRANSFER",
                              style: CustomStyles.black14600),
                          const SizedBox(height: 10),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: WalletTranferController.nameController,
                            hintText: "Enter Name",
                            labelText: 'Name',
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Name is required";
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            labelText: "Mobile",
                            controller:
                                WalletTranferController.mobileController,
                            textInputType:
                                TextInputType.numberWithOptions(decimal: false),
                            inputformater: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            hintText: "Enter Mobile",
                            length: 10,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Mobile is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                                "NOTE: Money can be transferred to only AntPay Waltet",
                                style: CustomStyles.red10500),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: CustomElevatedButton(
                                width: 100,
                                onPressed: () {
                                  if (SessionManager().getPayUMpinStatus()) {
                                    WalletTranferController.send2FAOtp("SET");
                                    CustomToast.show("Please set your MPIN");
                                  } else {
                                    if (SessionManager()
                                        .getPayUMpinExpiryStatus()!) {
                                      WalletTranferController.send2FAOtp(
                                          "RESET");
                                      CustomToast.show("MPIN Expired");
                                    } else {
                                      WalletTranferController.addBeneficiary();
                                    }
                                  }
                                },
                                text: "Add Payee",
                                textstyle: CustomStyles.black12600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Registerd Beneficiaries", style: CustomStyles.black13500),
                const SizedBox(height: 10),
                Obx(() {
                  if (WalletTranferController.beneficiaryList.isEmpty) {
                    return const Center(child: Text("No beneficiaries found"));
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: WalletTranferController.beneficiaryList.length,
                    itemBuilder: (context, index) {
                      var baneficiaryList =
                          WalletTranferController.beneficiaryList[index];

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
                              SessionManager().addFromScreen("Wallet Transfer");
String mobile = baneficiaryList.mobileNumber ?? '';
if (mobile.length == 12 && mobile.startsWith('91')) {
  mobile = mobile.substring(2); 
}
                              Get.to(
                                () => AccountTransferScreen(
                                  beneficiaryData: WalletTranferController
                                      .beneficiaryList[index],
                                ),
                                
                              );
                            WalletTranferController.getCustomerRecord(mobile);
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
