import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class InsuranceHomeScreen extends StatelessWidget {
  InsuranceHomeScreen({super.key});

  final RxBool isLoading = false.obs;

  // ------------- Buy Insurance Section -------------
  final List<String> insuranceIcons = [
    'assets/images/ic_life_insurance.png',
    'assets/images/ic_bike_insurance_orange.png',
    'assets/images/ic_car_insurance_red.png',
    'assets/images/ic_health_insurance_pink.png',
    'assets/images/ic_freedom_plan.png',
    'assets/images/ic_ulip.png',
  ];

  final List<String> insuranceNames = [
    "Term Insurance",
    "Bike Insurance",
    "Car Insurance",
    "Health Insurance",
    "Freedom Plan",
    "ULIP",
  ];

  // ------------- Services Section -------------
  final List<String> serviceIcons = [
    'assets/images/set_reminder.png',
    'assets/images/claim_assistance.png',
  ];

  final List<String> serviceNames = [
    "Set Reminder",
    "Claim Assistance",
  ];

  // ------------- Premium Section -------------
  final List<String> premiumIcons = [
    'assets/images/ic_life_insurance.png',
    'assets/images/ic_car_insurance_red.png',
    'assets/images/ic_health_insurance_pink.png',
  ];

  final List<String> premiumNames = [
    "Term Insurance",
    "Motor Insurance",
    "Health Insurance",
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Obx(
        () => isLoading.value
            ? const Center(child: Customloader())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    _buildSectionTitle("Buy Insurance"),
                    _buildInsuranceGrid(),
                    const SizedBox(height: 10),
                    _buildSectionTitle("Services"),
                    _buildServicesGrid(),
                    const SizedBox(height: 10),
                    _buildSectionTitle("Insurance Premium"),
                    _buildPremiumGrid(),
                    const SizedBox(height: 10),
                    _buildSectionTitle("View Existing Policies"),
                    _buildNoPolicyCard(),
                    const SizedBox(height: 10),
                    _buildFooterText(),
                  ],
                ),
              ),
      ),
    );
  }

  // ------------------ SECTION TITLE ------------------
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 5),
      child: Text(title, style: CustomStyles.black14600),
    );
  }

  // ------------------ BUY INSURANCE GRID ------------------
  Widget _buildInsuranceGrid() {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
          ),
          itemCount: insuranceNames.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.toNamed(RoutesName.insuranceDetailView, arguments: {
                //   "insuranceType": insuranceNames[index],
                // });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    insuranceIcons[index],
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    insuranceNames[index],
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

  // ------------------ SERVICES GRID ------------------
  Widget _buildServicesGrid() {
    return Card(
      elevation: 2.0,
      color: CustomStyles.bgcolor,
      surfaceTintColor: CustomStyles.bgcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: serviceNames.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  // Get.toNamed(RoutesName.setReminderScreen);
                } else if (index == 1) {
                  // Get.toNamed(RoutesName.claimAssistanceScreen);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(serviceIcons[index], width: 30, height: 30),
                  const SizedBox(height: 4),
                  Text(
                    serviceNames[index],
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

  // ------------------ INSURANCE PREMIUM GRID ------------------
  Widget _buildPremiumGrid() {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: premiumNames.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // SessionManager().addServicetype(premiumNames[index]);
                // Get.toNamed(
                // RoutesName.insurancePremiumScreen,
                // arguments: {"insuranceType": premiumNames[index]},
                // );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(premiumIcons[index], width: 30, height: 30),
                  const SizedBox(height: 4),
                  Text(
                    premiumNames[index],
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

  // ------------------ NO POLICY CARD ------------------
  Widget _buildNoPolicyCard() {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            "No Policy to Show",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ),
    );
  }

  // ------------------ FOOTER ------------------
  Widget _buildFooterText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Text(
        "Powered by Antworks Insurance Broking and Risk Consulting Pvt. Ltd.\n"
        "IRDAI Direct Broker (Life and General) - Reg No. 481, valid till 23-Feb-2026.\n\n"
        "Trade Logo Antworks and AntPay are owned by Antworks Group and licensed to use by all Antworks Group companies.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
  }
}
