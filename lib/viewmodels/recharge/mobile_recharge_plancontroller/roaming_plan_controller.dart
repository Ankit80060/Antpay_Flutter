import 'package:antpay_lite/model/recharge_model/fetchplan_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:get/get.dart';
import '../../../../utils/common_utils.dart';

class RoamingPlanController extends GetxController {

  var loading = false.obs;
  var roamingPlans = <Datalist>[].obs;

  late fetchplan_list_model fetchplanListModelObject;

  @override
  void onInit() {
    super.onInit();
    fetchServicePlan();
  }

  Future<void> fetchServicePlan() async {
    loading.value = true;
    try {
      var datain = fetchPlanRequestModel(
        circle: SessionManager().getValue(),
        operator: SessionManager().getOperator(),
        type: 'mobile',
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      fetchplanListModelObject = await MobileRechargePlanController().fetchplanin(datain);
      Dataplan? data = fetchplanListModelObject.dataplan;

      roamingPlans.clear();
      if (data?.Romaing != null) {
        roamingPlans.addAll(data!.Romaing!);
      }
    } catch (e) {
      CommonUtils.showToast("Error fetching roaming plans: $e");
    }
    loading.value = false;
  }
}
