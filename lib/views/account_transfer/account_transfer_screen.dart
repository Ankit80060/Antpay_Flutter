import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/AccountTransfer/customer_fetch_beneficiary.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/account_transfer_controller/account_transfer_controller.dart';
import 'package:antpay_lite/views/resetMpin/confirm_mpin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class AccountTransferScreen extends StatelessWidget {
  BeneficiaryData? beneficiaryData;
  AccountTransferScreen({super.key,this.beneficiaryData});

  final controller = Get.put(AccountTransferController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {



    return MainScaffold(
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                  ),
                ]),
            child: Form(key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("ENTER AMOUNT", style: CustomStyles.black14600),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: "Amount",
                      controller: controller.amountController,
                   textInputType: TextInputType.numberWithOptions(decimal: false),
                      inputformater: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: "Enter Amount",
                      length: 6,
                        validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Amount is required";
                                }
                                return null;
                              },
                    ),
                    CustomTextField(
                      controller: controller.remarkController,
                      hintText: "Enter Message",
                      labelText: 'Message',
                      validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Message is required";
                                }
                                return null;
                              },
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                          SessionManager().addValue(controller.amountController.text);
                          SessionManager().addMessage(controller.remarkController.text);
                            Get.offAll(()=>ConfirmMPINScreen(),arguments: beneficiaryData);
                          }
                         
                        },
                        text: "Send Money"),
                    const SizedBox(height: 4),
                 Align(
                      alignment: Alignment.centerRight,
                      child:  Text(
                            "Wallet Balance: ₹${SessionManager().getPayUCustomerWalletBalance() ?? '0.00'}",
                            style: CustomStyles.grey125,
                          )),
                  
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
