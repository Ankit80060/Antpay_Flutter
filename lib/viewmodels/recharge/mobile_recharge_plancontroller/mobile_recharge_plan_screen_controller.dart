import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/model/recharge_model/fetchplan_list_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/repository/recharge_repository/mobilerecharge_repo.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:get/get.dart';

import '../amount_recharge_controller.dart';

class MobileRechargePlanController extends GetxController {
  final planController = Get.find<AmountMobileRechargeController>();

  var fetchplanListModelObject =
      fetchplan_list_model().obs; 
  var billList = <Dataplan>[].obs; 
  var isLoading = false.obs;

  // Reactive variables
  var amount = ''.obs;
  var topUpDescription = ''.obs;
  var topUpValidity = ''.obs;

  // Setters (not strictly required, but keeps logic clean)
  void setAmount(String? value) {
    if (value != null) {
      amount.value = value;
    SessionManager().addRechargeAmount(value);

      planController.setAmount(value);

    }
  }

  void setTopUpDescription(String value) {
    topUpDescription.value = value;
  }

  void setTopUpValidity(String value) {
    topUpValidity.value = value;
  }

  ///  Fetch plans API call
  Future<fetchplan_list_model> fetchplanin(fetchPlanRequestModel data) async {
    MobileRechargeRepo repoClass = MobileRechargeRepo();


    fetchplan_list_model response = await repoClass.fetchplanapi(
      data,
      AuthToken.getAuthToken(),
      SessionManager().getToken().toString(),
    );


    fetchplanListModelObject.value = response; // store response in observable
    return response;
  }

  Future<void> servicePlan() async {
    try {
      isLoading.value = true;

      fetchPlanRequestModel requestModel = fetchPlanRequestModel(
        circle: SessionManager().getValue(),
        operator: SessionManager().getOperator(),
        type: 'mobile',
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      );

      final response = await fetchplanin(requestModel);

      Dataplan? data = response.dataplan;

      billList.clear();
      if (data != null) {
        billList.add(data);

        // TopUp plans
        for (Datalist topUp in data.datalist ?? []) {
          SessionManager().addTopamount(topUp.rs.toString());
          SessionManager().addTopdesc(topUp.desc.toString());
          SessionManager().addTopvalidity(topUp.validity.toString());
        }

        // 3G/4G plans
        for (Datalist threeG in data.data3g4g ?? []) {
          SessionManager().add3Gamount(threeG.rs.toString());
          SessionManager().add3Gdesc(threeG.desc.toString());
          SessionManager().add3Gvalidity(threeG.validity.toString());
        }

        

        
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}
