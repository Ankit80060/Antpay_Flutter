import 'package:antpay_lite/views/wallet_setting.dart/controller/walletSettingController.dart';
import 'package:get/get.dart';


class WalletSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletSettingController>(() => WalletSettingController());
  }
} 
