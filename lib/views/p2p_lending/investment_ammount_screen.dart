import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/custom_textfield.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_amount_controller.dart';
import 'package:antpay_lite/views/p2p_lending/investment_loan_agreement_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MainScaffold.dart';
import '../../res/color_palette.dart';
import '../../utils/common_utils.dart';

class InvestmentAmountView extends StatelessWidget {
  final InvestmentAmountController controller =
      Get.put(InvestmentAmountController());

  InvestmentAmountView({super.key});

  @override
  Widget build(BuildContext context) {


    return MainScaffold(
      
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: Customloader())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/banner.png',
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildForm(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
              ),
            ]),
        child: Column(
          children: [
            Text(
              'Lend-Social',
              style: CustomStyles.p20500,
            ),
            const SizedBox(height: 10),
            Text(
              'Choose an investment amount',
              style: CustomStyles.black14600,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            CustomTextField(
              labelText:
                  "Investment Amount ( min ₹ ${SessionManager().getMinInvAmount() ?? 5000} )",
              controller: controller.investAmountController,
              hintText: "Enter Amount",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended',
                style: CustomStyles.black13500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildAmountSuggestion('₹ 25000', 1),
                const SizedBox(width: 10.0),
                _buildAmountSuggestion('₹ 35000', 2),
                const SizedBox(width: 10.0),
                _buildAmountSuggestion('₹ 50000', 3),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Checkbox(
                    activeColor: Colors.red,
                    value: controller.isChecked.value,
                    onChanged: (val) =>
                        controller.isChecked.value = val ?? false,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "I Agree to ",
                    style: CustomStyles.black12300,
                    children: [
                      TextSpan(
                          text: "Terms of use",
                          recognizer: controller.tapGestureRecogniserTC,
                          style: CustomStyles.red13500),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              onPressed: () async{
                // controller.generateOrderAndPay(),
                final enteredAmountStr =
                    controller.investAmountController.text.trim();
                final minimumInvestmentStr =
                    SessionManager().getMinInvAmount()?.trim() ?? "0";
                    

                if (enteredAmountStr.isEmpty) {
                  CustomToast.show('Please Enter Amount');
                  return;
                }

                final enteredAmount = int.tryParse(
                      enteredAmountStr.replaceAll(RegExp(r'[^0-9]'), ''),
                    ) ??
                    0;

                final minimumInvestment = int.tryParse(
                      minimumInvestmentStr.replaceAll(RegExp(r'[^0-9]'), ''),
                    ) ??
                    0;
                if (enteredAmount < minimumInvestment) {
                  CustomToast.show(
                      'Amount should not be less than or equal to ₹${minimumInvestment ?? 5000}');
                } else {
          await SessionManager().saveMinInvAmtEnter(enteredAmount.toString());
                  Get.to(() => LoanAgreementScreen());
                }
              },
              text: "Proceed to Pay",
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAmountSuggestion(String amount, int index) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;

      return GestureDetector(
        onTap: () {
          controller.selectedIndex.value = index;
          controller.investAmountController.text = amount.replaceAll('₹ ', '');
        },
        child: Container(
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                amount,
                style:
                    isSelected ? CustomStyles.black12400 : CustomStyles.grey125,
              ),
            ),
          ),
        ),
      );
    });
  }
}
