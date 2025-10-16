import 'package:json_annotation/json_annotation.dart';

part 'bill_pay_request.g.dart';

@JsonSerializable()
class BillPayRequest {

  @JsonKey(name: 'amount')
  final String? amount;

  @JsonKey(name: 'ant_txn_id')
  final String? antTxnId;

  @JsonKey(name: 'bill_result')
  final Map<String,dynamic>? billResult;

  @JsonKey(name: 'biller_category')
  final String? billerCategory;

  @JsonKey(name: 'billerId')
  final String? billerId;

  @JsonKey(name: 'inputparameter')
  final Map<String, dynamic>? inputparameter;

  @JsonKey(name: 'mobile')
  final String? mobile;


  @JsonKey(name: 'requestId')
  final String? requestId;


  @JsonKey(name: 'payu_response')
  final String? payuResponse;

  @JsonKey(name:'aParam')
  String? aParam;
   @JsonKey(name:'email')
  String? email;


  BillPayRequest({
    this.antTxnId,
    this.billerCategory,
    this.billerId,
    this.mobile,
    this.amount,
    this.requestId,
    this.inputparameter,
    this.billResult,
    this.payuResponse,
    this.aParam,
    this.email
  });

  factory BillPayRequest.fromJson(Map<String, dynamic> json) =>
      _$BillPayRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BillPayRequestToJson(this);
}

@JsonSerializable()
class BillResult {
  @JsonKey(name: 'responseCode')
  final String? responseCode;

  @JsonKey(name: 'inputParams')
  final InputParams? inputParams;

  @JsonKey(name: 'billerResponse')
  final BillerResponse? billerResponse;

  @JsonKey(name: 'additionalInfo')
  final AdditionalInfo? additionalInfo;

  BillResult({
    this.responseCode,
    this.inputParams,
    this.billerResponse,
    this.additionalInfo,
  });

  factory BillResult.fromJson(Map<String, dynamic> json) =>
      _$BillResultFromJson(json);

  Map<String, dynamic> toJson() => _$BillResultToJson(this);
}

@JsonSerializable()
class BillPayResult {
  @JsonKey(name: 'responseCode')
  String? responseCode;

  @JsonKey(name: 'responseReason')
  String? responseReason;

  @JsonKey(name: 'txnRefId')
  String? txnRefId;

  @JsonKey(name: 'approvalRefNumber')
  String? approvalRefNumber;

  @JsonKey(name: 'txnRespType')
  String? txnRespType;

  @JsonKey(name: 'CustConvFee')
  String? custConvFee;

  @JsonKey(name: 'RespAmount')
  String? respAmount;

  @JsonKey(name: 'RespBillNumber')
  String? respBillNumber;

  @JsonKey(name: 'RespCustomerName')
  String? respCustomerName;

  @JsonKey(name: 'inputParams')
  InputParams? inputParams;

  BillPayResult({
    this.responseCode,
    this.responseReason,
    this.txnRefId,
    this.approvalRefNumber,
    this.txnRespType,
    this.custConvFee,
    this.respAmount,
    this.respBillNumber,
    this.respCustomerName,
    this.inputParams,
  });

  factory BillPayResult.fromJson(Map<String, dynamic> json) =>
      _$BillPayResultFromJson(json);

  Map<String, dynamic> toJson() => _$BillPayResultToJson(this);
}

@JsonSerializable()
class InputParams {
  @JsonKey(name: 'input')
  dynamic param1;


  // Add more fields as per actual data

  InputParams({this.param1});

  factory InputParams.fromJson(Map<String, dynamic> json) =>
      _$InputParamsFromJson(json);

  Map<String, dynamic> toJson() => _$InputParamsToJson(this);
}


@JsonSerializable()
class BillerResponse {
  @JsonKey(name: 'billAmount')
  final double? billAmount;

  @JsonKey(name: 'billDate')
  final String? billDate;

  @JsonKey(name: 'billNumber')
  final String? billNumber;

  @JsonKey(name: 'billPeriod')
  final String? billPeriod;

  @JsonKey(name: 'customerName')
  final String? customerName;

  @JsonKey(name: 'dueDate')
  final String? dueDate;

  BillerResponse({
    this.billAmount,
    this.billDate,
    this.billNumber,
    this.billPeriod,
    this.customerName,
    this.dueDate,
  });

  factory BillerResponse.fromJson(Map<String, dynamic> json) =>
      _$BillerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillerResponseToJson(this);
}

@JsonSerializable()
class AdditionalInfo {
  @JsonKey(name: 'info')
  final dynamic info;

  AdditionalInfo({this.info});

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}


@JsonSerializable()
class BillPayResponse {
  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'response')
  final BillPayResult? response;

  @JsonKey(name: 'error_msg')
  final String? errorMsg;

  BillPayResponse({
    this.status,
    this.response,
    this.errorMsg,
  });

  factory BillPayResponse.fromJson(Map<String, dynamic> json) =>
      _$BillPayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillPayResponseToJson(this);
}