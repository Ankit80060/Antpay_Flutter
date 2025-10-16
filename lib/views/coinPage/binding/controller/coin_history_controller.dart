
import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../api/auth_token.dart';

import '../../../../model/rewardHostory/point_history_bean.dart';
import '../../../../prefrences/session_manager.dart';
import '../../../../repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import '../../../../utils/app_constant.dart';

class CoinHistoryPageController extends GetxController {
  MiniAccountRepo _repository2 = MiniAccountRepo();

  RxBool isLoading = false.obs;
  RxList<Transaction> coinHistory = <Transaction>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCoinHistoryData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<CoinHistoryPageController>()) {
      Get.delete<CoinHistoryPageController>();
    }
  }
String getCurrentDateStamp() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
   Future<void> getCoinHistoryData() async {
    try {
      isLoading.value = true;
      pointHistoryRequestPOJO data = pointHistoryRequestPOJO(
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        mobile: SessionManager().getMobile().toString(),
        pageNo: '1',
        fromDate: getCurrentDateStamp(),
        toDate: getCurrentDateStamp(),
      );


      final response = await _repository2.fetchCoinHistoryData(
          SessionManager().getToken().toString(),
          AuthToken.getAuthToken(),
        request: data,
      );
      if (response.status.toString() == '1') {
coinHistory.assignAll(response.transactions);
      } else {
        coinHistory.clear();
        //  CustomToast.show(response.msg.toString());
      
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
