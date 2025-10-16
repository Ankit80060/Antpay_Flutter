import 'package:json_annotation/json_annotation.dart';

part 'transaction_history_response_model.g.dart';


@JsonSerializable()
class CustomerTransactionHistoryRequestModel {
  @JsonKey(name: 'messageCode')
  String? messageCode;
 @JsonKey(name: 'aParam')
  String? aParam;

  @JsonKey(name: 'requestDateTime')
  String? requestDateTime;

  @JsonKey(name: 'clientTxnId')
  String? clientTxnId;

  @JsonKey(name: 'fromDate')
  String? fromDate;

  @JsonKey(name: 'toDate')
  String? toDate;

  @JsonKey(name: 'last4Digits')
  String? last4Digits;

  @JsonKey(name: 'urn')
  String? urn;

  @JsonKey(name: 'customerId')
  String? customerId;

  @JsonKey(name: 'pageNumber')
  String? pageNumber;

  @JsonKey(name: 'count')
  String? count;

  @JsonKey(name: 'fromRowId')
  String? fromRowId;

  CustomerTransactionHistoryRequestModel({
    this.aParam,
    this.messageCode,
    this.requestDateTime,
    this.clientTxnId,
    this.fromDate,
    this.toDate,
    this.last4Digits,
    this.urn,
    this.customerId,
    this.pageNumber,
    this.count,
    this.fromRowId,

  });

  factory CustomerTransactionHistoryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerTransactionHistoryRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerTransactionHistoryRequestModelToJson(this);
}


@JsonSerializable()
class CustomerTransactionHistoryResponseModel {
  @JsonKey(name: 'urn')
  int? urn;

  @JsonKey(name: 'customerId')
  String? customerId;

  @JsonKey(name: 'responseCode')
  String? responseCode;

  @JsonKey(name: 'messageCode')
  int? messageCode;

  @JsonKey(name: 'clientTxnId')
  String? clientTxnId;

  @JsonKey(name: 'clientId')
  String? clientId;

  @JsonKey(name: 'responseDateTime')
  String? responseDateTime;

  @JsonKey(name: 'responseMessage')
  String? responseMessage;

  @JsonKey(name: 'bankId')
  int? bankId;

  @JsonKey(name: 'availableBalance')
  String? availableBalance;

  @JsonKey(name: 'availableCashLimit')
  String? availableCashLimit;

  @JsonKey(name: 'pageNumber')
  int? pageNumber;

  @JsonKey(name: 'count')
  int? count;

  @JsonKey(name: 'openingBalance')
  String? openingBalance;

  @JsonKey(name: 'closingBalance')
  String? closingBalance;

  @JsonKey(name: 'statementDetails')
  List<StatementDetails>? statementDetails;

  CustomerTransactionHistoryResponseModel({
    this.urn,
    this.customerId,
    this.responseCode,
    this.messageCode,
    this.clientTxnId,
    this.clientId,
    this.responseDateTime,
    this.responseMessage,
    this.bankId,
    this.availableBalance,
    this.availableCashLimit,
    this.pageNumber,
    this.count,
    this.openingBalance,
    this.closingBalance,
    this.statementDetails,
  });

  factory CustomerTransactionHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerTransactionHistoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerTransactionHistoryResponseModelToJson(this);
}

@JsonSerializable()
class StatementDetails {
  @JsonKey(name: 'merchantName')
  String? merchantName;

  @JsonKey(name: 'transactionType')
  String? transactionType;

  @JsonKey(name: 'transactionAmount')
  String? transactionAmount;

  @JsonKey(name: 'transactionDate')
  String? transactionDate;

  @JsonKey(name: 'merchantCity')
  String? merchantCity;

  @JsonKey(name: 'transRefNumber')
  String? transRefNumber;

  @JsonKey(name: 'reserved1')
  String? reserved1;

  @JsonKey(name: 'reserved2')
  String? reserved2;

  @JsonKey(name: 'reserved4')
  String? reserved4;

  @JsonKey(name: 'eventId')
  int? eventId;

  @JsonKey(name: 'rowId')
  int? rowId;

  @JsonKey(name: 'authEpfTxnId')
  String? authEpfTxnId;

  @JsonKey(name: 'rrn')
  String? rrn;

  @JsonKey(name: 'stan')
  String? stan;

  @JsonKey(name: 'approvalCode')
  String? approvalCode;

  @JsonKey(name: 'isMerchantTxn')
  int? isMerchantTxn;

  @JsonKey(name: 'clientTxnId')
  String? clientTxnId;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'closingBalance')
  int? closingBalance;

  @JsonKey(name: 'openningBalance')
  int? openingBalance;

  @JsonKey(name: 'transactionNarration')
  String? transactionNarration;

  @JsonKey(name: 'mcc')
  int? mcc;

  StatementDetails({
    this.merchantName,
    this.transactionType,
    this.transactionAmount,
    this.transactionDate,
    this.merchantCity,
    this.transRefNumber,
    this.reserved1,
    this.reserved2,
    this.reserved4,
    this.eventId,
    this.rowId,
    this.authEpfTxnId,
    this.rrn,
    this.stan,
    this.approvalCode,
    this.isMerchantTxn,
    this.clientTxnId,
    this.status,
    this.closingBalance,
    this.openingBalance,
    this.transactionNarration,
    this.mcc,
  });

  factory StatementDetails.fromJson(Map<String, dynamic> json) =>
      _$StatementDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$StatementDetailsToJson(this);
}

