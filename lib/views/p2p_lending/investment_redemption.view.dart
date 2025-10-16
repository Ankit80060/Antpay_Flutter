import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/p2p_lending/InvestmentDetailsModel.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_redemption_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainScaffold.dart';

class InvestmentRedemptionRequestView extends StatelessWidget {
  final InvestmentRedemptionController controller =
      Get.put(InvestmentRedemptionController());

  InvestmentRedemptionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: Customloader());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Investment ID (${SessionManager().getDsinvestmentNumber()})',
                style: CustomStyles.black18600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey.shade300,
                          padding: const EdgeInsets.all(8),
                          child: const Row(
                            children: [
                              _TableHeaderCell("SN", width: 40),
                              _TableHeaderCell("Date", width: 120),
                              _TableHeaderCell("Particular", width: 220),
                              _TableHeaderCell("Receipt", width: 100),
                              _TableHeaderCell("Payment", width: 100),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        ...controller.dataList
                            .map((item) => _InvestmentRow(item))
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _TableHeaderCell extends StatelessWidget {
  final String text;
  final double width;

  const _TableHeaderCell(this.text, {required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Text(
        text,
        style: CustomStyles.black12600,
      ),
    );
  }
}

Widget _InvestmentRow(InvestmentDetailsData item) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        _TableCell(item.sr?.toString() ?? '-', width: 40),
        _TableCell(item.date ?? '-', width: 120),
        _TableCell(item.particular ?? '-', width: 220),
        _TableCell(item.receipt ?? '-', width: 100),
        _TableCell(item.payment?.toString() ?? '-', width: 100),
      ],
    ),
  );
}

class _TableCell extends StatelessWidget {
  final String text;
  final double width;

  const _TableCell(this.text, {required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Text(
        text,
        style: CustomStyles.black12300,
      ),
    );
  }
}
