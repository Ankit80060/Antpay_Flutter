import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:antpay_lite/model/loan_model/loan_request_model.dart';
import 'package:get/get.dart';

class LoanVerifyDetailsController extends GetxController {
  Rx<LoanRequestModel?> data = Rx<LoanRequestModel?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  void onInit() {
    super.onInit();
    print(
        "LoanVerifyDetailsController initialized with arguments: ${Get.arguments}");
    final args = Get.arguments;
    if (args is LoanRequestModel) {
      data.value = args;
      isLoading.value = false;
      print("Data set in controller: ${data.value?.toJson()}");
    } else {
      errorMessage.value = "Invalid argument type received";
      isLoading.value = false;
      CustomToast.show("Error: Invalid data received");
    }
  }

  // Future<void> applyLoan() async {
  //   isLoading.value = true;
  //   try {
  //     final userdata = ApplyLoanUserData(
  //       fname: data.value?.userData.personalDetails?.name,
  //       mobile: data.value?.userData.personalDetails?.phone ?? '',
  //       dob: data.value?.userData.dob,
  //       state: data.value?.userData.state,
  //       city: data.value?.userData.city,
  //       loanName: data.value?.userData.loanName,
  //       loanAmount: data.value?.userData.min_loan_amount,
  //       companyName: data.value?.userData.companyName,
  //       companyType: data.value?.userData.companyType,
  //       qualification: data.value?.userData.qualification,
  //       bankName: data.value?.userData.bankName,
  //       appName: "AntPay",
  //     );
  //     final request = UserDataWrapper(userData: userdata);
  //     // Simulate API call (replace with actual implementation)
  //     await Future.delayed(const Duration(seconds: 1)); // Placeholder
  //     Get.snackbar("Success", "Loan application submitted!",
  //         backgroundColor: Colors.green, colorText: Colors.white);
  //   } catch (e) {
  //     errorMessage.value = "Error submitting loan: $e";
  //     Get.snackbar("Error", errorMessage.value,
  //         backgroundColor: Colors.red, colorText: Colors.white);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
