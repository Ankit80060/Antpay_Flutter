import 'package:antpay_lite/api/auth_token.dart';
import 'package:antpay_lite/api/comman_api_repo.dart';
import 'package:antpay_lite/model/transaction/transaction_response_model.dart';
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/utils/app_constant.dart';
import 'package:get/get.dart';

class TransactionDetailController extends GetxController {
  var isLoading = true.obs;
  var transactionDetails = Rxn<TransactionResponseModel>();
  var totalAmount = "0".obs;
  late String transactionNo;
  late bool isSuccess;
  

  Future<void> fetchTransactionDetails(String transactionNo) async {
    try {
      CommonApiRepo repo = CommonApiRepo();

      TransactionRequestModel request = TransactionRequestModel(
        mobile: SessionManager().getMobile(),
        transactionNo: transactionNo,
        aParam: AppConstant.generateAuthParam(
          SessionManager().getMobile().toString(),
        ),
      );

      TransactionResponseModel response = await repo.apiClient.transactiondetails(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request,
      );

      transactionDetails.value = response;

      double amount = double.tryParse(response.amount?.toString() ?? "0") ?? 0;
      double feeRate = double.tryParse(response.feeRate?.toString() ?? "0") ?? 0;
      totalAmount.value = "${amount + feeRate}";

      isLoading.value = false;
      print(response);
    } catch (e) {
      print("Error fetching transaction details: $e");
      isLoading.value = false;
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
        final args = Get.arguments as Map<String, dynamic>? ?? {};
    transactionNo = args['transactionNo'] ?? "";
    isSuccess = args['isSuccess'] ?? false;

    fetchTransactionDetails(transactionNo);
  }
}
