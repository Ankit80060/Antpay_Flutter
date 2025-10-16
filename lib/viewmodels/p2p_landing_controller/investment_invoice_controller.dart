import 'dart:convert';

import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:antpay_lite/model/p2p_lending/InvestmentInvoiceRequest.dart';
import 'package:antpay_lite/model/p2p_lending/InvestmentInvoiceResponse.dart';
import 'package:antpay_lite/model/p2p_lending/social_payment_generate_order_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/views/payment_view/razoepay_payment_screen.dart';
import 'package:get/get.dart';

class InvestmentInvoiceDetailController extends GetxController {
  CommonApiRepo repoClass = CommonApiRepo();
  var totalAmount = "Loading...".obs;
  var investedAmount = "N.A".obs;
  var processingFee = "N.A".obs;
  var platformFee = "N.A".obs;
  var isLoading = false.obs;

  Future<void> getInvestmentInvoiceDetails() async {
    try {
      isLoading(true);

      final mobile = SessionManager().getMobile().toString();
      final amount = await SessionManager().getMinInvAmtEnter()??SessionManager().getMinInvAmount();
      final partnerId = SessionManager().getPartnerId().toString();
      final schemeId = SessionManager().getSchemeId().toString();

      final now = DateTime.now();
      final formattedDateTime =
          "${now.toIso8601String().substring(0, 10)} ${now.toIso8601String().substring(11, 19)}";
      final aParam = base64Encode(utf8.encode("$mobile|$formattedDateTime"));

      final request = InvestmentInvoiceRequest(
        amount: amount.toString(),
        mobile: mobile,
        partnerId: partnerId,
        schemeId: schemeId,
        aParam: aParam,
      );

      InvestmentInvoiceResponse response = await repoClass.lenSocialApiClient
          .investmentInvoiceDetails(
              "TVRJek5EVT0",
              "Basic YW50QXBwXzIwMjM6QW50X1NlY3VyZSZAMSE2NQ==",
              SessionManager().getToken().toString(),
              request);

      if (response.status == 1) {
        final invoice = response.data;
        totalAmount.value = invoice?.totalAmount?.toString() ?? "0";
        investedAmount.value = invoice?.amount ?? "0";
        processingFee.value = invoice?.lenderProcessingFee?.toString() ?? "0";
        platformFee.value = invoice?.lenderPlatformFee?.toString() ?? "0";

        CustomToast.show("Invoice details fetched!");
      } else {
        CustomToast.show("Failed to fetch invoice");
      }
    } catch (e) {
      print("Error: $e");
      CustomToast.show("Something went wrong");
    } finally {
      isLoading(false);
    }
  }

  // Future<void> getGenerateOrder() async {
  //   try {
  //     isLoading(true);

  //     final request = SocialPaymentGenerateOrderRequestModel(
  //       amount: "1",
  //       channel: 'PG',
  //       mobile: SessionManager().getMobile().toString(),
  //       service: 'social-lending',
  //       source: CustomStyles.source,
  //     );

  //     SocialPaymentGenerateOrderResponseModel response =
  //         await repoClass.apiClient.socialGenerateOrder(
  //             SessionManager().getToken().toString(),
  //             AuthToken.getAuthToken(),
  //             request);

  //     if (response.status.toString() == "1") {
    
  //       SessionManager().addGnerateOrderResponse(
  //         response.amount.toString(),
  //         response.order_id.toString(),
  //         response.api_key.toString(),
  //         response.ant_txn_id.toString(),
  //         response.pg_type.toString(),
  //         "social-lending",
  //       );
  //       CustomToast.show(response.msg ?? "Order Generate Succesfully");
  //       RazorpaySingleton().makePayment(
  //         response.api_key!,
  //         response.order_id!,
  //         response.amount.toString(),
  //         Get.context!,
  //         "social-lending",
  //       );
  //     } else {
  //       CustomToast.show("Failed to generate order");
  //     }
  //   } catch (e) {
  //     print("❌ Error generating order: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInvestmentInvoiceDetails();
  }
}
