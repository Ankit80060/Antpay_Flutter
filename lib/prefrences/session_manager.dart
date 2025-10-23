import 'dart:convert';

import 'package:antpay_lite/model/billpay/FastageModelbillavenue.dart';
import 'package:antpay_lite/model/billpay/FetchBillBean.dart';
import 'package:antpay_lite/model/billpay/loan_repayment_biller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  // Singleton
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  static late SharedPreferences _pref;

  static Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

  void logOutUser() {
    _pref.clear();
  }

  // Device
  static const String KEY_DEVICE_IP = "ipAddress";
  static const String KEY_DEVICE_ID = "key_device_id";

  // User Basic
  static const String KEY_NAME = "name";
  static const String KEY_MOBILE = "mobile";
  static const String KEY_EMAIL = "email";
  static const String KEY_TOKEN = "token";
  static const String _IS_LOGIN = "IsLoggedIn";

  // User Extra
  static const String KEY_MARITAL_STATUS = "MARITAL_STATUS";
  static const String KEY_DATE_OF_BIRTH = "DATE_OF_BIRTH";
  static const String KEY_OCCUPATION = "OCCUPATION";
  static const String KEY_EDUCATION = "EDUCATION";
  static const String KEY_INCOME = "INCOME";
  static const String KEY_INVEST_IN_MUTUAL_FUND = "INVEST_IN_MUTUAL_FUND";
  static const String KEY_OWN_ASSETS = "OWN_ASSETS";

  // Autofill

  static const String KEY_GENDER = "gender";
  static const String KEY_CORPORATE_ID = "corporate_id";

  static const String KEY_AUTOFILL_NAME = "autofill_name";
  static const String KEY_AUTOFILL_GENDER = "autofill_gender";
  static const String KEY_AUTOFILL_DOB = "autofill_dob";
  static const String KEY_AUTOFILL_MARITAL_STATUS = "autofill_marital_status";
  static const String KEY_AUTOFILL_EDUCATION = "autofill_education";
  static const String KEY_AUTOFILL_OCCUPATION = "autofill_OCCUPATION";
  static const String KEY_AUTOFILL_BUSINESS_NAME = "autofill_business_name";
  static const String KEY_AUTOFILL_COMPANY_EMAIL = "autofill_company_email";
  static const String KEY_AUTOFILL_COMPANY_MOBILE = "autofill_company_mobile";
  static const String KEY_AUTOFILL_COMPANY_PAN = "autofill_company_pan";
  static const String KEY_AUTOFILL_COMPANY_ADDRESS = "autofill_company_address";
  static const String KEY_AUTOFILL_INDUSTRY = "autofill_industry_type";
  static const String KEY_AUTOFILL_STATE = "autofill_state_code";
  static const String KEY_AUTOFILL_CITY = "autofill_city";
  static const String KEY_AUTOFILL_PIN = "autofill_pin";
  static const String DS_INVESTMENT_NO = 'ds_investment_no';
  static const String KEY_PROFILE_PIC = "profile_pic";

  // Order / Payment
  static const String INVESTMENT_AMOUNT = "investment_amount";
  static const String ORDER_ID = "order_id";
  static const String RAZORPAY_API_KEY = "razorpay_api_key";
  static const String AMOUNT_TRANSCATION_ID = "amount_transcation_id";
  static const String PGTYPE = "pg_type";
  static const String SERVICE = "service";
  static const String SERVICE_WITH_CAPITAL = "SERVICE_WITH_CAPITAL";

  // Razorpay Response
  static const String SUCCESS_ORDER_ID = "success_order_id";
  static const String PAYMENTID = "paymentId";
  static const String SIGNATURE = "signature";

  // Wallet
  static const String ANT_COINS_BALANCE = "wallet_money";
  static const String PAYU_USER_TOKEN = "payu_user_token";
  static const String MPIN_STATUS = "mpin_status";
  static const String MPIN_EXPIRED = "mpin_expired";
  static const String CUSTOMER_LAST_4_DIGIT = "customer_last_4_digit";
  static const String CUSTOMER_URN = "customer_urn";
  static const String CHECK_USER_CUSTOMER_ID = "check_user_customer_id";
  static const String CLIENT_ID = "client_id";
  static const String CUSTOMER_EMAIL = "customer_email";
  static const String CUSTOMER_CARD_NUMBER = "customer_card_number";
  static const String CUSTOMER_KYC_TYPE = "customer_kyc_type";
  static const String CUSTOMER_UNIQUE_NUMBER_VALIDITY =
      "customer_unique_number_validity";
  static const String CUSTOMER_WALLET_ACCOUNT_NUMBER =
      "customer_wallet_account_number";
  static const String CUSTOMER_WALLET_ID = "customer_wallet_id";
  static const String CUSTOMER_WALLET_BALANCE = "customer_wallet_balance";
  static const String CUSTOMER_WALLET_STATUS = "customer_wallet_status";

  // Transaction / PayU
  static const String TRANSACTION_RESULT = "trans_result";
  static const String PAYU_RESPONSE = "payu_response";
//screen
  static const String FROM_SCREEN = "fromScreen";

  // check mobile Number api data
  static final String COMPANY_NAME = "company_name";
  static final String UTRANSCATION_ID = "utransaction_id";
  static final String STATE = "state";
  static final String PORTED = "ported";
  static final String MOBILE = "mobile";
  static final String RECHARGE_MOBILE = "recharge_mobile";

  static final String NUMBER = "number";

  static final String MNUMBER = "Mnumber";
  static final String Operator = "operator";
  static final String Topamount = "topamount";
  static final String Topdesc = "topdesc";
  static final String Topvalidity = "topvalidity";

  static final String Gamount = "gamount";
  static final String Gdesc = "gdesc";
  static final String Gvalidity = "gvalidity";
  static const String MESSAGE = "message";

  String WALLET_BALANCE = "wallet_money";
  static const String KEY_WALLET_STATUS = "wallet_status";

  String CUSTOMER_ID = "customerId";

  // BILLPAY

  static final String KEY_AMOUNT = "amount";
  static final String Bill_number = "bill_number";
  static final String Due_date = "due_date";
  static final String Bill_amount = "bill_amount";
  static final String Bill_customer = "bill_customer";
  static final String Bill_partial = "bill_partial";
  static final String Value = "value";
  static final String ParamName = "paramName";
  static final String biller_Id = "Biller_Id";
  static final String biller_Name = "Biller_Name";

  static final String Number_TaG = "Number_Tag";
  static final String Operator_Name = "Operator_Name";

  static final String Addinfo = "Addinfo";
  static final String loan_Biller_Response = "loanBillerResponse";
  static final String fastTag_Biller_Response = "fastTag_Biller_Response";

  static final String post_paid_Response = "loanPostPaidResponse";

  String ADD_UTRANSCATION_ID = "add_utransaction_id";
  static final String request_Id = "request_Id";
  static final String ADD_RechargeAmount = "ADD_RechargeAmount";

//kyc
  static const String _KEY_KYC_STATUS = "KYC";
  static const String LENDER_ID = "lender_id";
  static final String FULL_KYC_BASIC_DETAILS_USER_TYPE =
      "full_kyc_basic_details_user_type";
  static final String FULL_KYC_BASIC_DETAILS_SOURCE =
      "full_kyc_basic_details_source";
  static final String FULL_KYC_BASIC_DETAILS_PRODUCT =
      "full_kyc_basic_details_product";
  static const String MINIMUM_AMOUNT = "minimum_amount";
  static final String KEY_CUSTOM_TOKEN = "custom_token";

  //WalletTransefr

  static const String WALLET_TRANSFER_URN = "walletTranferurn";

  static const String WALLET_TRANSFER_ACCOUNT_NUMBER =
      "walletTranferAccountNumber";

  //  Session Methods

  //RECHAREGE
  static const String OPERATOR_CODE = "operator_code";

  // -------------------- Session Methods --------------------
  void createLoginSession(
    String name,
    String email,
    String maritalStatus,
    String dateOfBirth,
    String gender,
    String occupation,
    String education,
    String income,
    String investInMutualFund,
    String ownAssets,
    String token,
  ) {
    _pref.setBool(_IS_LOGIN, true);
    _pref.setString(KEY_TOKEN, token);
    _pref.setString(KEY_NAME, name);
    _pref.setString(KEY_EMAIL, email);
    _pref.setString(KEY_MARITAL_STATUS, maritalStatus);
    _pref.setString(KEY_DATE_OF_BIRTH, dateOfBirth);
    _pref.setString(KEY_GENDER, gender);
    _pref.setString(KEY_OCCUPATION, occupation);
    _pref.setString(KEY_EDUCATION, education);
    _pref.setString(KEY_INCOME, income);
    _pref.setString(KEY_INVEST_IN_MUTUAL_FUND, investInMutualFund);
    _pref.setString(KEY_OWN_ASSETS, ownAssets);
  }

  bool userLoggedIn() {
    return _pref.getBool(_IS_LOGIN) ?? false;
  }

  Future<void> clearPreferences() async {
    await _pref.clear();
  }

  //  Device
  void setDeviceIpAddress(String? ip) {
    _pref.setString(KEY_DEVICE_IP, ip ?? "");
  }

  void setDeviceId(String id) {
    _pref.setString(KEY_DEVICE_ID, id);
  }

  String? getDeviceId() => _pref.getString(KEY_DEVICE_ID);

  //  User
  void addMobile(String mobile) => _pref.setString(KEY_MOBILE, mobile);
  String? getMobile() => _pref.getString(KEY_MOBILE);

  void addCorporateID(String corporateID) {
    _pref.setString(KEY_CORPORATE_ID, corporateID);
  }

  void addUserName(String name) => _pref.setString(KEY_NAME, name);
  String? getName() => _pref.getString(KEY_NAME);

  void addToken(String token) => _pref.setString(KEY_TOKEN, token);

  String? getCorporateID() => _pref.getString(KEY_CORPORATE_ID) ?? 'null';

  String? getUserEmail() => _pref.getString(KEY_EMAIL);

  String? getToken() {
    return _pref.getString(KEY_TOKEN) ?? 'null';
  }

  void addAntCoinsMoney(String? wallet) {
    _pref.setString(ANT_COINS_BALANCE, wallet ?? "0");
  }

  String? getAntCoinsMoney() {
    return _pref.getString(ANT_COINS_BALANCE) ?? "0";
  }

  //  Order / Payment
  void addServicetype(String s) => _pref.setString(SERVICE_WITH_CAPITAL, s);
  String? getServiceType() => _pref.getString(SERVICE_WITH_CAPITAL);

  void addChannelType(String s) => _pref.setString(PGTYPE, s);
  String? getChannelType() => _pref.getString(PGTYPE);
  // -------------------- Order / Payment --------------------

  void addAntTxnId(String txnId) =>
      _pref.setString(AMOUNT_TRANSCATION_ID, txnId);
  String? getAntTxnId() => _pref.getString(AMOUNT_TRANSCATION_ID) ?? 'null';

  void addGnerateOrderResponse(
    String investmentAmount,
    String orderId,
    String razorpayApiKey,
    String amountTransactionId,
    String pgType,
    String service,
  ) {
    _pref.setString(INVESTMENT_AMOUNT, investmentAmount);
    _pref.setString(ORDER_ID, orderId);
    _pref.setString(RAZORPAY_API_KEY, razorpayApiKey);
    _pref.setString(AMOUNT_TRANSCATION_ID, amountTransactionId);
    _pref.setString(PGTYPE, pgType);
    _pref.setString(SERVICE, service);
  }

  Map<dynamic, dynamic> getGenerateOrderResponse() {
    return {
      INVESTMENT_AMOUNT: _pref.getString(INVESTMENT_AMOUNT),
      ORDER_ID: _pref.getString(ORDER_ID),
      RAZORPAY_API_KEY: _pref.getString(RAZORPAY_API_KEY),
      AMOUNT_TRANSCATION_ID: _pref.getString(AMOUNT_TRANSCATION_ID),
      PGTYPE: _pref.getString(PGTYPE),
      SERVICE: _pref.getString(SERVICE),
    };
  }

  //  Transaction / PayU
  void addTranscationResult(int result) {
    _pref.setInt(TRANSACTION_RESULT, result);
  }

  int getTranscationResult() {
    return _pref.getInt(TRANSACTION_RESULT) ?? 0;
  }

  void addPayUResponse(String r) {
    _pref.setString(PAYU_RESPONSE, r);
  }

  String getPayUResponse() {
    return _pref.getString(PAYU_RESPONSE) ?? "";
  }

  void setAutofillData(
    String name,
    String gender,
    String dateOfBirth,
    String maritalStatus,
    String education,
    String occupation,
    String businessName,
    String companyEmail,
    String companyMobile,
    String companyPan,
    String companyAddress,
    String industryType,
    String stateCode,
    String city,
    String pin,
  ) {
    _pref.setString(KEY_AUTOFILL_NAME, name);
    _pref.setString(KEY_AUTOFILL_GENDER, gender);
    _pref.setString(KEY_AUTOFILL_DOB, dateOfBirth);
    _pref.setString(KEY_AUTOFILL_MARITAL_STATUS, maritalStatus);
    _pref.setString(KEY_AUTOFILL_EDUCATION, education);
    _pref.setString(KEY_AUTOFILL_OCCUPATION, occupation);
    _pref.setString(KEY_AUTOFILL_BUSINESS_NAME, businessName);
    _pref.setString(KEY_AUTOFILL_COMPANY_EMAIL, companyEmail);
    _pref.setString(KEY_AUTOFILL_COMPANY_MOBILE, companyMobile);
    _pref.setString(KEY_AUTOFILL_COMPANY_PAN, companyPan);
    _pref.setString(KEY_AUTOFILL_COMPANY_ADDRESS, companyAddress);
    _pref.setString(KEY_AUTOFILL_INDUSTRY, industryType);
    _pref.setString(KEY_AUTOFILL_STATE, stateCode);
    _pref.setString(KEY_AUTOFILL_CITY, city);
    _pref.setString(KEY_AUTOFILL_PIN, pin);
  }

  void addFromScreen(String s) {
    _pref.setString(FROM_SCREEN, s);
  }

  String? getFromScreen() {
    return _pref.getString(FROM_SCREEN) ?? "";
  }

  void addPayUUserToken(String? s) {
    _pref.setString(PAYU_USER_TOKEN, s ?? "");
  }

  String? getPayUCustomerWalletTransferToken() {
    return _pref.getString(PAYU_USER_TOKEN ?? "");
  }

  void addPayUMpinStatus(bool bool) {
    _pref.setBool(MPIN_STATUS, bool ?? false);
  }

  bool getPayUMpinStatus() {
    return _pref.getBool(MPIN_STATUS) ?? false;
  }
  //   BILLPAYYY

  void addFetchBillResponse(
    String value,
    String amount,
    String bill_number,
    String due_date,
    String bill_amount,
    String bill_customer,
    String bill_partial,
  ) {
    _pref.setString(KEY_AMOUNT, amount);
    _pref.setString(Bill_number, bill_number);
    _pref.setString(Due_date, due_date);
    _pref.setString(Bill_amount, bill_amount);
    _pref.setString(Bill_customer, bill_customer);
    _pref.setString(Value, value);
  }

  Map<dynamic, dynamic> getFetchBillResponse() {
    Map getFetchBillResponse = {
      KEY_AMOUNT: _pref.getString(KEY_AMOUNT),
      Bill_number: _pref.getString(Bill_number),
      Due_date: _pref.getString(Due_date),
      Bill_amount: _pref.getString(Bill_amount),
      Bill_customer: _pref.getString(Bill_customer),
      Bill_partial: _pref.getString(Bill_partial),
      Bill_partial: _pref.getString(Value),
    };
    return getFetchBillResponse;
  }

  void addparamName(String paramName) {
    _pref.setString(ParamName, paramName);
  }

  String? getparamName() {
    return _pref.getString(ParamName) ?? 'null';
  }

  void AddbillerID(String BillerID) {
    _pref.setString(biller_Id, BillerID);
  }

  void addValue(String? value) {
    _pref.setString(Value, value ?? "");
  }

  String? getValue() {
    return _pref.getString(Value) ?? 'null';
  }

  void addamount(String? amount) {
    _pref.setString(KEY_AMOUNT, amount ?? "");
  }

  String? getamount() {
    return _pref.getString(KEY_AMOUNT) ?? 'null';
  }

  void addBill_number(String? bill_number) {
    _pref.setString(Bill_number, bill_number ?? "");
  }

  String? getBill_number() {
    return _pref.getString(Bill_number) ?? 'null';
  }

  void addDue_date(String? due_date) {
    _pref.setString(Due_date, due_date ?? "");
  }

  String? getDue_date() {
    return _pref.getString(Due_date) ?? 'null';
  }

  // void addBillDate(String? due_date) {
  //   _pref.setString(BILL_PERIOD, due_date ?? "-");
  // }

  // String? getBillDate() {
  //   return _pref.getString(BILL_PERIOD) ?? '-';
  // }

  void addBill_customer(String? bill_customer) {
    _pref.setString(Bill_customer, bill_customer ?? "");
  }

  String? getBill_customer() {
    return _pref.getString(Bill_customer) ?? 'null';
  }

  void addBill_partial(String? bill_partial) {
    _pref.setString(Bill_partial, bill_partial ?? "");
  }

  String? getBill_partial() {
    return _pref.getString(Bill_partial) ?? 'null';
  }

  void addNumber_Tag(String Number_Tag) {
    _pref.setString(Number_TaG, Number_Tag ?? "");
  }

  String? getNumber_Tag() {
    return _pref.getString(Number_TaG) ?? 'null';
  }

  void addOperator_Name(String operator_Name) {
    _pref.setString(Operator_Name, operator_Name);
  }

  String? getOperator_Name() {
    return _pref.getString(Operator_Name) ?? 'null';
  }

  void addOperatorCode(String operator_Code) {
    _pref.setString(OPERATOR_CODE, operator_Code);
  }

  String? getOperatorCode() {
    return _pref.getString(OPERATOR_CODE);
  }

  void addPayUMpinExpiryStatus(bool? mpinExpired) {
    _pref.setBool(MPIN_EXPIRED, mpinExpired ?? false);
  }

  void addTopamount(String topamount) {
    _pref.setString(Topamount, topamount);
  }

  String? getTopamount() {
    return _pref.getString(Topamount) ?? '0';
  }

  String? getPayUCustomerLast4Digit() {
    return _pref.getString(CUSTOMER_LAST_4_DIGIT ?? "");
  }

  void addTopdesc(String topdesc) {
    _pref.setString(Topdesc, topdesc);
  }

  String? getTopdesc() {
    return _pref.getString(Topdesc) ?? 'null';
  }

  void addTopvalidity(String topvalidity) {
    _pref.setString(Topvalidity, topvalidity);
  }

  String? getTopvalidity() {
    return _pref.getString(Topvalidity) ?? 'null';
  }

  void add3Gamount(String gamount) {
    _pref.setString(Gamount, gamount);
  }

  String? get3GGamount() {
    return _pref.getString(Gamount) ?? 'null';
  }

  void add3Gdesc(String gdesc) {
    _pref.setString(Gdesc, gdesc);
  }

  String? get3Gdesc() {
    return _pref.getString(Gdesc) ?? 'null';
  }

  void add3Gvalidity(String gvalidity) {
    _pref.setString(Gvalidity, gvalidity);
  }

  String? get3Gvalidity() {
    return _pref.getString(Gvalidity) ?? 'null';
  }

  void addmobNumber(String mnumber) {
    _pref.setString(MNUMBER, mnumber);
  }

  String getmobNumber() {
    return _pref.getString(MNUMBER) ?? 'null';
  }

  void addOperator(String operator) {
    _pref.setString(Operator, operator);
  }

  String? getOperator() {
    return _pref.getString(Operator) ?? 'null';
  }

  // add check mobile Number api data
  void addMobileCheckResponse({
    String? companyName,
    String? utranscationId,
    String? state,
    dynamic ported,
    String? mobile,
    required String utransactionId,
  }) {
    _pref.setString(COMPANY_NAME, companyName ?? "");
    _pref.setString(UTRANSCATION_ID, utranscationId ?? "");
    _pref.setString(STATE, state ?? "");
    _pref.setString(PORTED, ported ?? "");
    _pref.setString(RECHARGE_MOBILE, mobile ?? "");
  }

  // get check mobile Number api data
  Map<dynamic, dynamic> getMobileCheckResponse() {
    Map mobileCheckDetailsGet = {
      COMPANY_NAME: _pref.getString(COMPANY_NAME),
      UTRANSCATION_ID: _pref.getString(UTRANSCATION_ID),
      STATE: _pref.getString(STATE),
      PORTED: _pref.getString(PORTED),
      MOBILE: _pref.getString(RECHARGE_MOBILE),
    };
    return mobileCheckDetailsGet;
  }

  String? getDeviceIpAddress() {
    return _pref.getString(KEY_DEVICE_IP);
  }

  String? getUserGender() {
    return _pref.getString(KEY_GENDER);
  }

  String? getCustomerId() {
    return _pref.getString(CUSTOMER_ID);
  }

  void addCustomerId(String id) {
    _pref.setString(CUSTOMER_ID, id);
  }

  bool? getPayUMpinExpiryStatus() {
    return _pref.getBool(MPIN_EXPIRED) ?? false;
  }

  String? getPayUCustomerUrn() {
    return _pref.getString(CUSTOMER_URN ?? "");
  }

  String? getPayUCustomerId() {
    return _pref.getString(CHECK_USER_CUSTOMER_ID ?? "");
  }

  Future<void> addPayUCustomerDetails({
    required String customerId,
    required String clientId,
    required String urn,
    required String email,
    required String cardNumber,
    required String last4Digits,
    required String kycType,
    required String uniqueNumberValidity,
    required String walletAccountNumber,
    required String walletId,
    required String accountBalance,
    required String walletStatus,
  }) async {
    //final SharedPreferences _pref = await SharedPreferences.getInstance();

    await _pref.setString(CHECK_USER_CUSTOMER_ID, customerId);
    await _pref.setString(CLIENT_ID, clientId);
    await _pref.setString(CUSTOMER_URN, urn);
    await _pref.setString(CUSTOMER_EMAIL, email);
    await _pref.setString(CUSTOMER_CARD_NUMBER, cardNumber);
    await _pref.setString(CUSTOMER_LAST_4_DIGIT, last4Digits);
    await _pref.setString(CUSTOMER_KYC_TYPE, kycType);
    await _pref.setString(
        CUSTOMER_UNIQUE_NUMBER_VALIDITY, uniqueNumberValidity);
    await _pref.setString(CUSTOMER_WALLET_ACCOUNT_NUMBER, walletAccountNumber);
    await _pref.setString(CUSTOMER_WALLET_ID, walletId);
    await _pref.setString(CUSTOMER_WALLET_BALANCE, accountBalance);
    await _pref.setString(CUSTOMER_WALLET_STATUS, walletStatus);
  }

  void addKYC(String kycStatus) {
    _pref.setString(_KEY_KYC_STATUS, kycStatus);
  }

  String? getKYC() {
    return _pref.getString(_KEY_KYC_STATUS) ?? 'null';
  }

  String? getCustomerKycType() {
    return _pref.getString(CUSTOMER_KYC_TYPE ?? '');
  }

  String? getUserAccountBalance() {
    return _pref.getString(CUSTOMER_WALLET_BALANCE ?? "0");
  }

  void addNumber(String s) {}
  String getNumber() {
    return _pref.getString(NUMBER) ?? 'null';
  }

  void addBillerId(String? billerId) {
    _pref.setString(biller_Id, billerId ?? "");
  }

  void addBilerName(String? billerName) {
    _pref.setString(biller_Name, billerName ?? "");
  }

  getBillerId() {
    return _pref.getString(biller_Id);
  }

  getBillerName() {
    return _pref.getString(biller_Name);
  }

  void storeBillerDetailsData(LoanRepaymentBillResult loanBillerResponse) {
    _pref.setString(
      loan_Biller_Response,
      jsonEncode(loanBillerResponse.toJson()),
    );
  }

  LoanRepaymentBillResult? getBillerDetailsData() {
    final data = _pref.getString(loan_Biller_Response);
    if (data == null) return null;

    final map = jsonDecode(data) as Map<String, dynamic>;
    return LoanRepaymentBillResult.fromJson(map);
  }

  void addBillerRequestId(String reqId) {
    _pref.setString(request_Id, reqId ?? "");
  }

  getBillerRequestId() {
    return _pref.getString(request_Id);
  }

  static void storePostPaidRetriveData(AddInfo addInfo) {
    _pref.setString(
      post_paid_Response,
      jsonEncode(addInfo.toJson()),
    );
  }

  AddInfo? getPostPaidDetailsData() {
    final data = _pref.getString(post_paid_Response);
    if (data == null) return null;

    final map = jsonDecode(data) as Map<String, dynamic>;
    return AddInfo.fromJson(map);
  }

  void addUTransactionId(String s) {
    _pref.setString(ADD_UTRANSCATION_ID, s);
  }

  String? getUTransactionID() {
    return _pref.getString(ADD_UTRANSCATION_ID);
  }

  void addFastBillerDetailsData(BillResult billResult) {
    _pref.setString(
      fastTag_Biller_Response,
      jsonEncode(billResult.toJson()),
    );
  }

  BillResult? getFastBillerDetailsData() {
    final data = _pref.getString(fastTag_Biller_Response);
    if (data == null) return null;

    final map = jsonDecode(data) as Map<String, dynamic>;
    return BillResult.fromJson(map);
  }

  void addRechargeAmount(String value) {
    _pref.setString(ADD_RechargeAmount, value);
  }

  String? getRechargeAmount() {
    return _pref.getString(ADD_RechargeAmount);
  }

  String? getBeneficiaryWalletAccNo() {
    return _pref.getString(CUSTOMER_WALLET_ACCOUNT_NUMBER);
  }

  void addMessage(String message) {
    _pref.setString(MESSAGE, message);
  }

  String? getMessage() {
    return _pref.getString(MESSAGE);
  }

  void addPayUCustomerWalletBalance(String s) {
    _pref.setString(CUSTOMER_WALLET_BALANCE, s);
  }

  String? getPayUCustomerWalletBalance() {
    return _pref.getString(CUSTOMER_WALLET_BALANCE);
  }


  String? getWalletStatus() {
    return _pref.getString(CUSTOMER_WALLET_STATUS);
  }

  void addDsInvestmentNumber(String DsInvestmentNo) {
    _pref.setString(DS_INVESTMENT_NO, DsInvestmentNo);
  }

  String? getDsinvestmentNumber() {
    return _pref.getString(DS_INVESTMENT_NO);
  }

  void addLenderId(String lenderId) {
    _pref.setString(LENDER_ID, lenderId);
  }

  String? getLenderId() {
    return _pref.getString(LENDER_ID);
  }

  void addFullKycTypeDetails(String userType, String source, String product) {
    _pref.setString(FULL_KYC_BASIC_DETAILS_USER_TYPE, userType);
    _pref.setString(FULL_KYC_BASIC_DETAILS_SOURCE, source);
    _pref.setString(FULL_KYC_BASIC_DETAILS_PRODUCT, product);
  }

  Map<dynamic, dynamic> getFullKycTypeDetails() {
    Map fullKycTypeDetails = {
      FULL_KYC_BASIC_DETAILS_USER_TYPE:
          _pref.getString(FULL_KYC_BASIC_DETAILS_USER_TYPE),
      FULL_KYC_BASIC_DETAILS_SOURCE:
          _pref.getString(FULL_KYC_BASIC_DETAILS_SOURCE),
      FULL_KYC_BASIC_DETAILS_PRODUCT:
          _pref.getString(FULL_KYC_BASIC_DETAILS_PRODUCT),
    };

    return fullKycTypeDetails;
  }

  void addSchemeDetailsFull({
    required String partnerId,
    required String schemeId,
    required String minInvAmount,
    required String maxInvAmount,
    required String schemeName,
    required String roc,
    required String description,
  }) {
    _pref.setString("partnerId", partnerId);
    _pref.setString("schemeId", schemeId);
    _pref.setString("minInvAmount", minInvAmount);
    _pref.setString("maxInvAmount", maxInvAmount);
    _pref.setString("schemeName", schemeName);
    _pref.setString("roc", roc);
    _pref.setString("description", description);
  }

  String? getPartnerId() {
    return _pref.getString("partnerId");
  }

  String? getSchemeId() {
    return _pref.getString("schemeId");
  }

   saveMinInvAmtEnter(String enteredAmountinvsave) {
    _pref.setString("minInvAmountEnter", enteredAmountinvsave);
  }
    String? getMinInvAmtEnter() {
    return _pref.getString("minInvAmountEnter");
  }

  String? getMinInvAmount() {
    return _pref.getString("minInvAmount");
  }

  String? getMaxInvAmount() {
    return _pref.getString("maxInvAmount");
  }

  String? getSchemeName() {
    return _pref.getString("schemeName");
  }

  String? getRoc() {
    return _pref.getString("roc");
  }

  String? getDescription() {
    return _pref.getString("description");
  }

  String? getMinimumAmount() {
    return _pref.getString(MINIMUM_AMOUNT);
  }

  void addCustomToken(String token) {
    _pref.setString(KEY_CUSTOM_TOKEN, token);
  }

  String? getCustomToken() {
    return _pref.getString(KEY_CUSTOM_TOKEN) ?? 'null';
  }

  void addProfilePic(String imageUrl) {
    _pref.setString(KEY_PROFILE_PIC, imageUrl);
  }

  String? getProfilePic() {
    return _pref.getString(KEY_PROFILE_PIC);
  }

  String? getUserOwnAssets() {
    return _pref.getString(KEY_PROFILE_PIC);
  }

  String? getUserInvestmentStatus() {
    return _pref.getString(KEY_INVEST_IN_MUTUAL_FUND);
  }

  String? getUserDOB() {
    return _pref.getString(KEY_DATE_OF_BIRTH);
  }

  String? getUserMaritalStatus() {
    return _pref.getString(KEY_MARITAL_STATUS);
  }

  String? getUserOccupation() {
    return _pref.getString(KEY_OCCUPATION);
  }

  String? getUserEducation() {
    return _pref.getString(KEY_EDUCATION);
  }

  String? getUserIncome() {
    return _pref.getString(KEY_INCOME);
  }

 void addwallettranferReceiver({
    required String walletTranferurn,
    required String walletTranferAccountNumber,
  }) async {
    await _pref.setString(WALLET_TRANSFER_URN, walletTranferurn);

    await _pref.setString(
        WALLET_TRANSFER_ACCOUNT_NUMBER, walletTranferAccountNumber);
  }

  String? getwalletTranferurn() {
    return _pref.getString(WALLET_TRANSFER_URN);
  }
   String? getwalletTranferAccountNumber() {
    return _pref.getString(WALLET_TRANSFER_ACCOUNT_NUMBER);
  }

 void addReterieveaccountNumber(String accountNumber) {
  _pref.setString("account_number", accountNumber);
}

String? getReterieveaccountNumber() {
  return _pref.getString("account_number");
}

}
