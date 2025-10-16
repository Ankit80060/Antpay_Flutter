import 'package:antpay_lite/viewmodels/loan/loan_home_controller.dart';
import 'package:antpay_lite/views/creditCardApply/widgets/credit_card_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';
import '../../custom_widget/custom_appbar.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/customstyles.dart';
import '../../custom_widget/image_widget.dart';
import '../../prefrences/session_manager.dart';
import '../../res/color_palette.dart';
import '../../utils/routes/routes_name.dart';
import '../../viewmodels/creditCardApply/credit_card_controller.dart';

class CrediCradApplyHomeView extends StatelessWidget {
  CrediCradApplyHomeView({super.key});

  CreditCardApplyController controller = Get.put(CreditCardApplyController());
  LoanHomeController loanHomeController = Get.put(LoanHomeController());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NetworkImageWithLoader(
                    url:
                        "https://antworksmoney.com/app/assets/credit-card-offers/card-banner.png",
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16.0),
                  // Score Section

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: CustomStyles.bgcolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoBox(
                            loanHomeController.experianScore.value.toString(),
                            "Experian Credit Score"),
                        _buildInfoBox(
                            loanHomeController.activeLoanAccounts.value
                                .toString(),
                            "Active Loan Account"),
                        _buildInfoBox(
                          "${loanHomeController.creditUtilisation.value}%",
                          "Credit Card Utilisation",
                        ),
                        _buildInfoBox(
                          loanHomeController.delayedPayments.value.toString(),
                          "Delayed Payment",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text('Pre Approved Credit Card',
                      style: CustomStyles.black14500.copyWith(fontSize: 15)),
                  SizedBox(height: 16.0),

                  // Dynamic Card List
                  SizedBox(
                    height: 288,
                    child: Obx(
                      () => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.creditCkardData.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 220,
                            child: CreditCardWidget(
                                card: controller.creditCkardData[index]),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text('Credit Card Bill Payment',
                      style: CustomStyles.black14500.copyWith(fontSize: 15)),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      SessionManager().addServicetype("Credit Card");
                      Get.toNamed(RoutesName.bharatBillPayTemplateView);
                    },
                    child: NetworkImageWithLoader(
                      
                           assetImage: "assets/images/ccbillpay-banr.png",
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text('Credit Card Fixed Deposit',
                      style: CustomStyles.black14500.copyWith(fontSize: 15)),
                  SizedBox(
                    height: 16.0,
                  ),
                  NetworkImageWithLoader(
                     assetImage: "assets/images/cc-fd.png",
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => controller.loading.value
                ? Container(
                    color: Colors.black.withOpacity(0.03),
                    child: const Center(
                      child: Customloader(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      )),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 8,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ SECTION TITLE ------------------
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 5),
      child: Text(
        title,
        style: CustomStyles.black14600,
      ),
    );
  }
}
