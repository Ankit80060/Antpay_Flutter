import 'package:antpay_lite/model/recharge_model/fetchplan_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:get/get.dart';
import '../../../../utils/common_utils.dart';

class SMSPlanController extends GetxController {

  var loading = false.obs;
  var fullTimePlans = <Datalist>[].obs;

  late fetchplan_list_model fetchplanListModelObject;

  @override
  void onInit() {
    super.onInit();
    fetchFullTimePlans();
  }

  Future<void> fetchFullTimePlans() async {
    loading.value = true;
    try {
      var request = fetchPlanRequestModel(
        circle: SessionManager().getValue(),
        operator: SessionManager().getOperator(),
        type: 'mobile',
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      final mobileRechargePlanController = MobileRechargePlanController();
      fetchplanListModelObject = await mobileRechargePlanController.fetchplanin(request);
      Dataplan? data = fetchplanListModelObject.dataplan;

      fullTimePlans.clear();
      if (data?.fullTT != null) {
        fullTimePlans.addAll(data!.fullTT!);
      }
    } catch (e) {
      CommonUtils.showToast(e.toString());
    }
    loading.value = false;
  }
}
