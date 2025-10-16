import 'package:antpay_lite/viewmodels/loan/Personalloan/occupation_details_controller.dart';
import 'package:antpay_lite/viewmodels/loan/Personalloan/personalloan_form_controller.dart';
import 'package:get/get.dart';

class PersonalloanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OccupationDetailsController>(
        () => OccupationDetailsController());
    Get.lazyPut<PersonalLoanController>(() => PersonalLoanController());
  }
}
