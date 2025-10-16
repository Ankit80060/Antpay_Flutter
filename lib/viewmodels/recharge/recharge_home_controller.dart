import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../api/auth_token.dart';
import '../../custom_widget/custom_toast_msg.dart';
import '../../model/wallet/point_balance_model.dart';
import '../../repository/login_repository/miniAccountRepo/mini_account_repo.dart';
import '../../utils/app_constant.dart';

class RechargHomeController extends GetxController {
  //  final MiniAccountRepo repository = MiniAccountRepo();
  var isLoading = false.obs;
  RxString coinsBalance = "0".obs;
  RxString walletBalance = "0.0".obs;

  @override
  void onInit() {
    walletBalance.value = SessionManager().getUserAccountBalance() ?? "0";
    coinsBalance.value = SessionManager().getAntCoinsMoney() ?? "0";
    super.onInit();
  }

  // Future<void> getPointBalance() async {
  //   try {
  //     PointBalanceRequestModel data = PointBalanceRequestModel(
  //         mobile: SessionManager().getMobile(),
  //         aParam: AppConstant.generateAuthParam(
  //             SessionManager().getMobile().toString()));

  //     PointBalanceResponseModel response = await repository.getPointBalance(
  //         SessionManager().getToken().toString(),
  //         AuthToken.getAuthToken(),
  //         data);

  //     if (response.status.toString() == '1') {
  //       coinsBalance.value = response.point ?? "0";
  //     } else {
  //       coinsBalance.value = '0';
  //       // CustomToast.show(response.msg.toString());
  //     }
  //   } catch (e) {
  //     CustomToast.show(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  handelCardClick() {
    Get.toNamed(RoutesName.coinPage);
  }
}
