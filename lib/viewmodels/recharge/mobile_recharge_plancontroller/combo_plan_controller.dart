import 'package:antpay_lite/model/recharge_model/fetchplan_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:antpay_lite/viewmodels/recharge/mobile_recharge_plancontroller/mobile_recharge_plan_screen_controller.dart';
import 'package:get/get.dart';
import '../../../../utils/common_utils.dart';

class ComboPlanController extends GetxController {
   final  mobileRechargePlanController = MobileRechargePlanController();
  var loading = false.obs;
  var comboPlans = <Datalist>[].obs;

  late fetchplan_list_model fetchplanListModelObject;

  @override
  void onInit() {
    super.onInit();
    fetchComboPlans();
  }
  Future<void> fetchComboPlans() async {
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

      comboPlans.clear();
      if (data?.COMBO != null) {
        comboPlans.addAll(data!.COMBO!);
      }
    } catch (e) {
      CommonUtils.showToast(e.toString());
    }
    loading.value = false;
  }
}
