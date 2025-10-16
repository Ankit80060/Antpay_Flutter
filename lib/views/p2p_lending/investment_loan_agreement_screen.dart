import 'package:antpay_lite/custom_widget/custom_button.dart';
import 'package:antpay_lite/custom_widget/custom_loader.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;

import 'package:antpay_lite/custom_widget/custom_appbar.dart';
import 'package:antpay_lite/viewmodels/p2p_landing_controller/investment_loan_aggrement_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../MainScaffold.dart';

class LoanAgreementScreen extends StatelessWidget {
  final controller = Get.put(LoanAgreementController());

  @override
  Widget build(BuildContext context) {

    return MainScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLoanSummaryCard(),
              const SizedBox(
                height: 10,
              ),
              _buildAgreementHtmlViewer(context),
              const SizedBox(
                height: 20,
              ),
              Obx(() => controller.isbtnLoading.value
                  ? const Center(child: Customloader())
                  : CustomElevatedButton(
                      width: 200,
                      onPressed: () {
                        controller.sendOtp();
                      },
                      text: "Accept & E-Sign",
                    ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoanSummaryCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5),
        ],
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoText('Amount Approved',
                      'Rs ${controller.approvedAmount.value}', Colors.green),
                  SizedBox(height: 8),
                  _infoText('Repayment Amount',
                      'Rs ${controller.repaymentAmount.value}', Colors.black),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoText('Loan Tenure', '${controller.tenure.value} Months',
                      Colors.green),
                  SizedBox(height: 8),
                  _infoText('Interest Rate', '${controller.interest.value} %',
                      Colors.black),
                ],
              )
            ],
          )),
    );
  }

  Widget _buildAgreementHtmlViewer(BuildContext context) {
    return Obx(() => Container(
          height: 450,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5),
            ],
          ),
          child: controller.isLoading.value
              ? const Center(child: Customloader())
              : SingleChildScrollView(
                  child: Html(
                    data: controller.agreement.value,
                    style: {
                      "body": Style(
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        fontSize: FontSize(12),
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      "p": Style(
                        margin: Margins.only(bottom: 0),
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      "ul": Style(
                        margin: Margins.only(left: 16, bottom: 8),
                        padding: HtmlPaddings.zero,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      "li": Style(
                        margin: Margins.only(bottom: 4),
                        fontSize: FontSize(12),
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      "a": Style(
                        color: Colors.red,
                        textDecoration: TextDecoration.underline,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      "strong": Style(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    },
                    onLinkTap: (String? url, Map<String, String> attributes,
                        dom.Element? element) async {
                      if (url != null) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri,
                              mode: LaunchMode.externalApplication);
                        } else {
                          print('Could not launch $url');
                        }
                      }
                    },
                  ),
                ),
        ));
  }

  Widget _infoText(String title, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: CustomStyles.grey126),
        Text(value,
            style: GoogleFonts.poppins(fontSize: 14, color: valueColor)),
      ],
    );
  }
}
