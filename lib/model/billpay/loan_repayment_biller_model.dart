import 'package:json_annotation/json_annotation.dart';

part 'loan_repayment_biller_model.g.dart';

@JsonSerializable()
class FetchBillerModel {
  FetchBillerModel(
      {this.mobile,
      this.biller_category,
      this.billerId,
      this.inputparameter,
      this.aParam});

  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'aParam')
  String? aParam;

  @JsonKey(name: 'biller_category')
  String? biller_category;

  @JsonKey(name: 'billerId')
  String? billerId;

  @JsonKey(name: 'inputparameter')
  Map<String, dynamic>? inputparameter;

  factory FetchBillerModel.fromJson(Map<String, dynamic> json) =>
      _$FetchBillerModelFromJson(json);

  Map<String, dynamic> toJson() => _$FetchBillerModelToJson(this);
}

@JsonSerializable()
class LoanRepaymentBillerModel {
  LoanRepaymentBillerModel(
      {this.status, this.msg, this.billResult, this.order_id, this.requestId});

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'bill_result')
  LoanRepaymentBillResult? billResult;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'order_id')
  String? order_id;

  @JsonKey(name: 'requestId')
  String? requestId;

  factory LoanRepaymentBillerModel.fromJson(Map<String, dynamic> json) =>
      _$LoanRepaymentBillerModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoanRepaymentBillerModelToJson(this);
}

@JsonSerializable()
class LoanRepaymentBillResult {
  LoanRepaymentBillResult(
      {this.responseCode, this.inputParams, this.billerResponse});

  @JsonKey(name: 'responseCode')
  String? responseCode;

  @JsonKey(name: 'inputParams')
  Map<String, dynamic>? inputParams;

  @JsonKey(name: 'billerResponse')
  LoanBillerResponse? billerResponse;

  factory LoanRepaymentBillResult.fromJson(Map<String, dynamic> json) =>
      _$LoanRepaymentBillResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoanRepaymentBillResultToJson(this);
}

@JsonSerializable()
class LoanBillerResponse {
  LoanBillerResponse(
      {this.billAmount = 0,
      this.billDate,
      this.billNumber,
      this.billPeriod,
      this.customerName,
      this.dueDate,
      this.customerconveniencefees = 0,
      this.total_amount_to_pay = 0});

  @JsonKey(name: 'billAmount')
  double billAmount = 0;

  @JsonKey(name: 'billDate')
  String? billDate;

  @JsonKey(name: 'billNumber')
  String? billNumber;

  @JsonKey(name: 'billPeriod')
  String? billPeriod;

  @JsonKey(name: 'customerName')
  String? customerName;

  @JsonKey(name: 'dueDate')
  String? dueDate;

  @JsonKey(name: 'customerconveniencefees')
  double customerconveniencefees = 0;

  @JsonKey(name: 'total_amount_to_pay')
  double total_amount_to_pay;

  factory LoanBillerResponse.fromJson(Map<String, dynamic> json) =>
      _$LoanBillerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoanBillerResponseToJson(this);
}
