import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth_token.dart';
import '../../../custom_widget/custom_toast_msg.dart';
import '../../../model/antPayCard/transaction_history_response_model.dart';
import '../../../prefrences/session_manager.dart';
import '../../../repository/login_repository/miniAccountRepo/transaction_repo.dart';
import '../../../utils/app_constant.dart';

class TransctionFilterController extends GetxController {
  TransactionRepo repository = TransactionRepo();
  RxBool isLoading = false.obs;
  RxString filter = "Select".obs;
  var fromDate = Rx<DateTime?>(null);  
var toDate   = Rx<DateTime?>(null);
  final List<String> filterData = [
    'Select',
    "Current Month",
    "Last Month",
    'Last 3 Month',
    'Last 6 Month',
    'Date Range'
  ].obs;
  RxList<StatementDetails> transactions = <StatementDetails>[].obs;
  final List<dynamic> transactionData = [
    {
      'title': "Wallet Loading by PG",
      'refId': "ANT2025070171429351664",
      'dateTime': "2025-07-10 17:35:49",
      'status': "SUCCESS",
      'amount': 10,
    },
    {
      'title': "OJI90020",
      'refId': "ANT2025070417036345489",
      'dateTime': "2025-07-04 12:10:37",
      'status': "FAILED",
      'amount': 1,
    },
    {
      'title': "OJI90020",
      'refId': "ANT20250704163103134543",
      'dateTime': "2025-07-04 16:26:35",
      'status': "SUCCESS",
      'amount': 1,
    }
  ].obs;

  var currentPage = 1;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWalletCardHistory(AppConstant.formatDate(DateTime.now()),AppConstant.formatDate(DateTime.now()));
  }

  void changeFilter(String value) {
    filter.value = value;
   var getDateRangeData=   getDateRange(value);

    getWalletCardHistory(getDateRangeData['toDate'],getDateRangeData['fromDate']);
  }

  Future<void> selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: isFrom && fromDate.value == null
          ? DateTime(2000)
          : isFrom
              ? DateTime(2000)
              : fromDate.value ?? DateTime(2000),
      lastDate: DateTime.now(),
      //  initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            useMaterial3: false,
            datePickerTheme: const DatePickerThemeData(
              // headerBackgroundColor: Colors.red,
              // headerForegroundColor: Colors.white,

              headerHelpStyle: TextStyle(
                fontSize: 0, // hides "SELECT DATE"
              ),
            ),
            primaryColor: Colors.red,
            colorScheme: const ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      if (isFrom) {
        fromDate.value = picked;
      } else {
        toDate.value = picked;
        getWalletCardHistory(AppConstant.formatDate(fromDate.value),AppConstant.formatDate(toDate.value));
 
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (Get.isRegistered<TransctionFilterController>()) {
      Get.delete<TransctionFilterController>();
    }
  }

  void getWalletCardHistory(startDate,endDate) async {
    try {
      isLoading.value = true;

      CustomerTransactionHistoryRequestModel requestModel =
          CustomerTransactionHistoryRequestModel(
              messageCode: "",
              requestDateTime: "",
              clientTxnId: "",
              fromDate: startDate,
              toDate: endDate,
              // fromDate: fromDate == null
              //     ? AppConstant.formatDate(startDate)
              //     : AppConstant.formatDate(fromDate!),
              // toDate: toDate == null
              //     ? AppConstant.formatDate(endDate)
              //     : AppConstant.formatDate(toDate!),
              last4Digits: SessionManager().getPayUCustomerLast4Digit(),
              urn: SessionManager().getPayUCustomerUrn(),
              customerId: SessionManager().getPayUCustomerId(),
              pageNumber: currentPage.toString(),
              count: "100",
              aParam: AppConstant.generateAuthParam(
                  SessionManager().getMobile().toString()));

      final response = await repository.getCardHistoryApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        request: requestModel,
      );

      if (response.responseCode == "00") {
        currentPage = response.pageNumber;
        transactions.assignAll(response.statementDetails!);
      } else {
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  static Map<String, String> getDateRange(String type) {
    final DateTime today = DateTime.now();
    late DateTime toDate;

    switch (type) {
      case "Current Month":
        toDate = DateTime(today.year, today.month, 1);
        break;

      case "Last Month":
        toDate = DateTime(today.year, today.month - 1, 1);
        break;

      case "Last 3 Month":
        toDate = DateTime(today.year, today.month - 3, 1);
        break;

      case "Last 6 Month":
        toDate = DateTime(today.year, today.month - 6, 1);
        break;

      default:
        throw ArgumentError("Invalid type: $type");
    }

    return {
      "fromDate": AppConstant.formatDate(today) ?? "",
      "toDate":  AppConstant.formatDate(toDate) ?? "",
    };
  }
}
