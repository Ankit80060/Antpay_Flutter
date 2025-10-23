import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../model/notification/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <Notifications>[].obs;
  var isLoading = false.obs;
  CommonApiRepo repo = CommonApiRepo();

  /// Fetch notifications
  Future<void> fetchNotifications() async {
    try {
      isLoading.value = true;

      final request = FetchNotificationRequestModel(
        mobile: SessionManager().getMobile().toString(),
        source: "Antpay",
      );

      FetchNotificationResponseModel response =
          await repo.apiClient.fetchNotifications(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request,
      );

      if (response.status.toString() == "1" &&
          response.notificationList != null) {
        notifications.value = response.notificationList!;
      } else {
        notifications.clear();
      }
    } on DioException catch (e) {
      notifications.clear();
      Get.snackbar("Error", e.response?.data.toString() ?? "Unknown API error");
    } catch (e) {
      notifications.clear();
      Get.snackbar("Error", "Error fetching notifications: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToPage(String? pageName) {
    switch (pageName) {
      case "Freedom Plan":
        // Get.toNamed(RoutesName.freedomPlan);
        break;

      case "loan":
      case "Personal_Loan":
      case "Home_Loan":
        Get.toNamed(RoutesName.loanhomescreen);
        break;

      case "Health Insurance":
        // Get.toNamed(RoutesName.healthInsurance);
        break;

      case "Bill_Pay":
        Get.toNamed(RoutesName.allBillPay);
        break;

      case "Mobile_Recharge":
        Get.toNamed(RoutesName.mobileRechargeView);
        break;

      // Offers
      case "offer":
      case "Education":
      case "Online Shopping":
      case "Health & Wellness":
      case "Food & Grocery":
      case "Travel":
      case "Entertainment":
      case "Jewelry":
      case "Home Improvement":
      case "offer_by_category":
        // Get.toNamed(RoutesName.offers);
        break;

      case "Premium_plan":
        // Get.toNamed(RoutesName.premiumPlan);
        break;

      case "credit_card":
      case "Credit_Card":
        Get.toNamed(RoutesName.creditCardFormView);
        break;

      case "Investment":
        Get.toNamed(RoutesName.investmentHomeView);
        break;

      case "Business_Loans":
        Get.toNamed(RoutesName.businessloanform);
        break;

      case "Car_Loan":
        Get.toNamed(RoutesName.carloanform);
        break;

      case "Fixed_Deposit":
        // Get.toNamed(RoutesName.fixedDeposit
        break;

      case "Mutul_Fund":
        // Get.toNamed(RoutesName.mutualFund);
        break;

      case "P2p_Micro Finance":
        Get.toNamed(RoutesName.p2pLending);
        break;

      case "Term_Insurance":
        // Get.toNamed(RoutesName.termInsurance);
        break;

      case "Bike_Insurence":
        // Get.toNamed(RoutesName.bikeInsurance);
        break;

      case "Car_Insurence":
        // Get.toNamed(RoutesName.carInsurance);
        break;

      case "ULP":
        // Get.toNamed(RoutesName.ulpInsurance);
        break;

      case "credit_counselling":
        // Get.toNamed(RoutesName.creditCounselling);
        break;

      default:
        CustomToast.show("Page not implemented: $pageName");
        break;
    }
  }
}
