import 'package:antpay_lite/model/recharge_model/fetchplan_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:get/get.dart';
import '../../../../utils/common_utils.dart';

class ThreeGPlanController extends GetxController {
final mobileRechargePlanController = MobileRechargePlanController();
  var loading = false.obs;
  var data3g4g = <Datalist>[].obs;

  late fetchplan_list_model fetchPlanListModelObject;

  @override
  void onInit() {
    super.onInit();
    fetchThreeGPlans();
  }

  Future<void> fetchThreeGPlans() async {
    loading.value = true;
    try {
      var requestModel = fetchPlanRequestModel(
        circle: SessionManager().getValue(),
        operator: SessionManager().getOperator(),
        type: 'mobile',
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      fetchPlanListModelObject = await mobileRechargePlanController.fetchplanin(requestModel);
      Dataplan? data = fetchPlanListModelObject.dataplan;

      data3g4g.clear();
      if (data?.data3g4g != null) {
        data3g4g.addAll(data!.data3g4g!);
      }
    } catch (e) {
      CommonUtils.showToast("Error fetching 3G/4G plans: $e");
    }
    loading.value = false;
  }
}
