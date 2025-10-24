import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/viewmodels/loan/loan_home_controller.dart';
import 'package:antpay_lite/views/loan/components/LoanCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class LoanHomeScreen extends StatelessWidget {
  LoanHomeScreen({super.key});

  final LoanHomeController controller = Get.put(LoanHomeController());

  final List<String> loanImagePaths = [
    'assets/images/ic_personal_loan.png',
    'assets/images/ic_home_loan.png',
    'assets/images/ic_credit_cards.png',
    'assets/images/ic_business_loan.png',
    'assets/images/ic_car_insurance.png',
  ];

  final List<String> loanIconName = [
    "Personal Loan",
    "Home Loan",
    "Credit Loan",
    "Business Loan",
    "Car Loan"
  ];

  final List<String> loanRepaymentPaths = [
    'assets/images/ic_loan_repay.png',
    "assets/images/creditcard_pay_db.png"
  ];

  final List<String> loanRepaymentIconName = [
    'Loan\nRepayment',
    "Credit Card\nPay"
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: Customloader())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    _buildCreditScoreCard(),
                    const SizedBox(height: 10),
                    _buildSectionTitle("Loan Bazaar"),
                    _buildLoanBazaar(),
                    const SizedBox(height: 10),
                    _buildSectionTitle("Loan Repayment"),
                    _buildLoanRepayment(),
                    const SizedBox(height: 10),
                    _buildSectionTitle("My Loans"),
                    _buildLoanList(),
                  ],
                ),
              ),
      ),
    );
  }

  // ------------------ CREDIT SCORE CARD ------------------
  Widget _buildCreditScoreCard() {
    return Obx(
      () => Card(
        elevation: 2.0,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Credit score image
              Image.asset('assets/images/creditscore.png', height: 70),

              const SizedBox(height: 8),

              Obx(() => Text(
                    "Credit Score: ${controller.creditScore.value}",
                    style: const TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 12,
                    ),
                  )),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                ),
                child: const Text(
                  "GET UPDATED CREDIT SCORE @ 49",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CustomStyles.bgcolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoBox("Experian Credit Score",
                        controller.experianScore.value.toString()),
                    _buildInfoBox("Active Loan Account",
                        controller.activeLoanAccounts.value.toString()),
                    _buildInfoBox("Credit Card Utilisation",
                        "${controller.creditUtilisation.value}%"),
                    _buildInfoBox("Delayed Payment",
                        controller.delayedPayments.value.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    const double _boxWidth = 70.0;

    return SizedBox(
      width: _boxWidth,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
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

  // ------------------ LOAN BAZAAR ------------------
  Widget _buildLoanBazaar() {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: loanIconName.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final imagePath = loanImagePaths[index];
                final loanType = loanIconName[index];
                final loanName = (index + 1).toString();
                // Using loanIconName as loanName

                if (index == 0) {
                  Get.toNamed(
                    RoutesName.personalloanform,
                    arguments: {
                      'image': imagePath,
                      'loanType': loanType,
                      'loanName': 10,
                    },
                  );
                } else if (index == 1) {
                  Get.toNamed(
                    RoutesName.personalloanform,
                    arguments: {
                      'image': imagePath,
                      'loanType': loanType,
                      'loanName': 1,
                    },
                  );
                } else if (index == 2) {
                  Get.toNamed(
                    RoutesName.crediCradApplyHomeView,
                    arguments: {
                      'image': imagePath,
                      'loanType': loanType,
                      'loanName': 9,
                    },
                  );
                } else if (index == 3) {
                  Get.toNamed(
                    RoutesName.personalloanform,
                    arguments: {
                      'image': imagePath,
                      'loanType': loanType,
                      'loanName': 7,
                    },
                  );
                } else if (index == 4) {
                  Get.toNamed(
                    RoutesName.carloanform,
                    arguments: {
                      'image': imagePath,
                      'loanType': loanType,
                      'loanName': loanName,
                    },
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(loanImagePaths[index], width: 30, height: 30),
                  const SizedBox(height: 4),
                  Text(
                    loanIconName[index],
                    textAlign: TextAlign.center,
                    style: CustomStyles.dblue12500.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ------------------ LOAN REPAYMENT ------------------
  Widget _buildLoanRepayment() {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: loanRepaymentIconName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  SessionManager().addServicetype("Loan Repayment");

                  Get.toNamed(
                    RoutesName.bharatBillPayTemplateView,
                    arguments: {"billerCategory": "Loan Repayment"},
                  );
                } else if (index == 1) {
                  Get.toNamed(
                    RoutesName.creditCardHomeView,
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(loanRepaymentPaths[index], width: 30, height: 30),
                  const SizedBox(height: 4),
                  Text(
                    loanRepaymentIconName[index],
                    textAlign: TextAlign.center,
                    style: CustomStyles.dblue12500.copyWith(fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoanList() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5.0),
            controller.isLoading.value
                ? const Center(child: Customloader())
                : controller.loanList == null || controller.loanList.isEmpty
                    ? Center(
                        child: Text(
                          "No Previous Loans",
                          style: CustomStyles.black12400,
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: controller.loanList.map((loan) {
                            final lenderStatus = loan.lenderDetails.isNotEmpty
                                ? loan.lenderDetails.first.lender_status
                                : "N/A";
                            return Container(
                              width: 370,
                              margin: const EdgeInsets.only(right: 8.0),
                              child: LoanCard(
                                loanTitle: loan.loanTypeName,
                                accountNumber: loan.loan_id,
                                status: lenderStatus ?? "N/A",
                                date: loan.updatedOn,
                                balance: loan.loanAmount ?? "N/A",
                                lenderDetails: loan.lenderDetails,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
