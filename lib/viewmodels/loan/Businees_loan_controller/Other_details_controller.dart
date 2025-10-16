import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherDetailsController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final data = <String, dynamic>{}.obs;
  final professionType = ''.obs;
  final industryType = ''.obs;
  final officeOwnership = ''.obs;
  final auditStatus = ''.obs;
  final defaultLoanStatus = ''.obs;
  final chequeBounceStatus = ''.obs;
  final companyRating = ''.obs;

  final dobController = TextEditingController();
  final cinController = TextEditingController();
  final netWorthController = TextEditingController();
  final experienceController = TextEditingController();
  final phoneController = TextEditingController();
  final grossTurnoverControllerLastYear = TextEditingController();
  final grossTurnoverController2 = TextEditingController();
  final grossTurnoverController3 = TextEditingController();
  final grossTurnoverControllerBeforeLastYear = TextEditingController();

  String? loanType;
  String? loanName;
  String? imagePath;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments is Map
        ? (Get.arguments as Map).cast<String, dynamic>()
        : null;
    if (args != null) {
      data.addAll(args);
      loanType = args['loanType']?.toString();
      loanName = args['loanName']?.toString();
      imagePath =
          args['image']?.toString() ?? 'assets/images/ic_business_loan.png';
    }
    print("OtherDetailsController args: $args");
  }

  void onSubmit() {
    try {
      if (formKey.currentState?.validate() ?? false) {
        // Explicitly type formData as Map<String, dynamic>
        final Map<String, dynamic> formData = {
          ...data, // Spread operator now safe since data is Map<String, dynamic>
          'loanType': loanType ?? '',
          'loanName': loanName ?? '',
          'image': imagePath ?? 'assets/images/ic_business_loan.png',
          'occupation': data['Occupation']?.toString() ?? '',
          'professionType': professionType.value,
          'industryType': industryType.value,
          'dateOfBirth': dobController.text,
          'cin': cinController.text,
          'netWorth': netWorthController.text,
          'totalExperience': experienceController.text,
          'officePhoneNumber': phoneController.text,
          'grossTurnover': grossTurnoverControllerLastYear.text,
          'grossTurnover2': grossTurnoverController2.text,
          'grossTurnover3': grossTurnoverController3.text,
          'grossTurnoverBeforeLastYear':
              grossTurnoverControllerBeforeLastYear.text,
          'officeOwnership': officeOwnership.value,
          'auditDone': auditStatus.value,
          'defaultedOnLoan': defaultLoanStatus.value,
          'checkBounced': chequeBounceStatus.value,
          'companyRatedByAgency': companyRating.value,
        };

        print(" Form Submitted: $formData");

        Get.toNamed(
          RoutesName.businessloanform,
          arguments: formData,
        );
      } else {
        print("Form validation failed!");
      }
    } catch (e, s) {
      print(" Error in onSubmit: $e");
      print("StackTrace: $s");
    }
  }

  @override
  void onClose() {
    dobController.dispose();
    cinController.dispose();
    netWorthController.dispose();
    experienceController.dispose();
    phoneController.dispose();
    grossTurnoverControllerLastYear.dispose();
    grossTurnoverController2.dispose();
    grossTurnoverController3.dispose();
    grossTurnoverControllerBeforeLastYear.dispose();
    super.onClose();
  }
}
