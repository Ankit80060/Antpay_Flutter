import 'package:antpay_lite/custom_widget/custom_toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api/auth_token.dart';
import '../../../model/payment/limit_update_request_model.dart';
import '../../../model/transaction/fetch_card_limit_model.dart';
import '../../../model/transaction/transaction_profile_model.dart';
import '../../../prefrences/session_manager.dart';
import '../../../repository/login_repository/miniAccountRepo/card_limit_repo.dart';
import '../../../utils/app_constant.dart';

class TransctionLimitController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSwitchOn = true.obs;
  RxBool isFetchData = false.obs;
  RxString kycStatus = "".obs;
  final CardLimitRepo repository = CardLimitRepo();

  final TextEditingController preTransactionAmount = TextEditingController();
  final TextEditingController dailyTransactionAmount = TextEditingController();
  final TextEditingController monthlyTransactionAmount =
      TextEditingController();
  final TextEditingController yearlyTransactionAmount = TextEditingController();

  RxString selected = "POS Contact".obs;
  var selectedDropDownId = RxnString();

  RxMap selectedDropDownItem = {}.obs;

  final List<dynamic> dropDownData1 = [
    {"id": 1, "textName": "POS Contact"},
    {"id": 2, "textName": "POS Contactless"},
    {"id": 3, "textName": "E-Commerce"},
    {"id": 4, "textName": "ATM Withdrawal"},
  ];
  final List<String> dropDownData = [
    "POS Contact",
    "POS Contactless",
    "E-Commerce",
    "ATM Withdrawal"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    kycStatus.value = SessionManager().getCustomerKycType()!;
  }

  handelChangeSwitch(bool val) {
    isSwitchOn.value = val;
  }

  handelSelectionChange(val) {
    selectedDropDownId.value = val["id"].toString();
    selectedDropDownItem.value = val;
    isFetchData.value = false;
    fetchCardLimitApi();

    // selected.value = val;
  }

  onSubmitLimit() {
    switch (selectedDropDownId.value) {
      case "1":
        fetchLimits("POS Contact");

        break;
      case "2":
        fetchLimits("POS Contactless");

        break;
      case "3":
        fetchLimits("E-Commerce");

        break;
      case "4":
        fetchLimits("ATM Withdrawal");

        break;
      default:
        CustomToast.show("Please select channel category");
    }
  }

  void fetchLimits(String s) {
    if (SessionManager().getCustomerKycType()! == "MIN KYC") {
      if (s == "ATM Withdrawal") {
        if (!isFetchData.value) {
          if (preTransactionAmount.text.isEmpty ||
              dailyTransactionAmount.text.isEmpty ||
              monthlyTransactionAmount.text.isEmpty ||
              yearlyTransactionAmount.text.isEmpty) {
            CustomToast.show("All fields are mandatory");
          } else if (int.parse(preTransactionAmount.text) > 2000) {
            CustomToast.show("Cannot exceed per transaction limit");
          } else if (int.parse(dailyTransactionAmount.text) > 10000) {
            CustomToast.show("Cannot exceed daily limit");
          } else if (int.parse(monthlyTransactionAmount.text) > 10000) {
            CustomToast.show("Cannot exceed monthly limit");
          } else if (int.parse(yearlyTransactionAmount.text) > 300000) {
            CustomToast.show("Cannot exceed yearly limit");
          } else {
            callUpdateCardApi(s);
          }
        } else {
          // set auto fill limit and call update card api
          callUpdateCardApi(s);
        }
      } else {
        if (!isFetchData.value) {
          if (preTransactionAmount.text.isEmpty ||
              dailyTransactionAmount.text.isEmpty ||
              monthlyTransactionAmount.text.isEmpty ||
              yearlyTransactionAmount.text.isEmpty) {
            CustomToast.show("All fields are mandatory");
          } else if (int.parse(preTransactionAmount.text) > 20000) {
            CustomToast.show("Cannot exceed per transaction limit");
          } else if (int.parse(dailyTransactionAmount.text) > 100000) {
            CustomToast.show("Cannot exceed daily limit");
          } else if (int.parse(monthlyTransactionAmount.text) > 100000) {
            CustomToast.show("Cannot exceed monthly limit");
          } else if (int.parse(yearlyTransactionAmount.text) > 300000) {
            CustomToast.show("Cannot exceed yearly limit");
          } else {
            callUpdateCardApi(s);
          }
        } else {
          callUpdateCardApi(s);
        }
      }
    } else {
      if (!isFetchData.value) {
        if (preTransactionAmount.text.isEmpty ||
            dailyTransactionAmount.text.isEmpty ||
            monthlyTransactionAmount.text.isEmpty ||
            yearlyTransactionAmount.text.isEmpty) {
          CustomToast.show("All fields are mandatory");
        } else if (int.parse(preTransactionAmount.text) > 10000) {
          CustomToast.show("Cannot exceed per transaction limit");
        } else if (int.parse(dailyTransactionAmount.text) > 100000) {
          CustomToast.show("Cannot exceed daily limit");
        } else if (int.parse(monthlyTransactionAmount.text) > 100000) {
          CustomToast.show("Cannot exceed monthly limit");
        } else if (int.parse(yearlyTransactionAmount.text) > 120000) {
          CustomToast.show("Cannot exceed yearly limit");
        } else {
          callUpdateCardApi(s);
        }
      } else {
        // set auto fill limit and call update card api

        // call card update api
        callUpdateCardApi(s);
      }
    }
  }

  void fetchCardLimitApi() async {
    try {
      isLoading.value = true;

      FetchCardLimitReqModel data = FetchCardLimitReqModel(
        urn: SessionManager().getPayUCustomerUrn(),
        customerId: SessionManager().getPayUCustomerId(),
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        // mobile: SessionManager().getMobile().toString(),
      );

      final response = await repository.getCardLimitApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );
      if (response.responseCode.toString() == "00") {
        isFetchData.value = true;
      } else {
        // isFetchData.value = true;
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void callTransactionProfileApi(
      String tranType, int profileId, bool isEnable) async {
    try {
      isLoading.value = true;

      final data = TransactionProfileRequestModel(
        enablementType: 1,
        transactionProfile: [
          TransactionProfile(
            status: isEnable.toString(),
            transactionProfileId: profileId.toString(),
            transactionType: tranType,
          ),
        ],
        urn: SessionManager().getPayUCustomerUrn()!,
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
      );

      final response = await repository.transactionProfileApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );
      if (response.responseCode.toString() == "00") {
      } else {
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void callUpdateCardApi(String s) async {
    try {
      isLoading.value = true;

      LimitUpdateRequest data = LimitUpdateRequest(
        id: SessionManager().getPayUCustomerId()!,
        dailyLimit: dailyTransactionAmount.text,
        monthlyLimit: monthlyTransactionAmount.text,
        perTxnLimit: preTransactionAmount.text,
        yearlyLimit: yearlyTransactionAmount.text,
        limitUpdateId: "-1",
        // urn: SessionManager().getPayUCustomerUrn(),
        aParam: AppConstant.generateAuthParam(
            SessionManager().getMobile().toString()),
        // mobile: SessionManager().getMobile().toString(),
      );

      final response = await repository.updateCardLimitApi(
        SessionManager().getToken().toString(),
        AuthToken.getAuthToken(),
        data,
      );
      if (response.responseCode.toString() == "00") {
        if (s == "POS Contact") {
          callTransactionProfileApi("pos", 2, isSwitchOn.value);
        } else if (s == "POS Contactless") {
          callTransactionProfileApi("pos", 2, isSwitchOn.value);
        } else if (s == "E-Commerce") {
          callTransactionProfileApi("e-com", 1, isSwitchOn.value);
        } else {
          callTransactionProfileApi("ATM", 3, isSwitchOn.value);
        }
      } else {
        CustomToast.show(response.responseMessage.toString());
      }
    } catch (e) {
      CustomToast.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
