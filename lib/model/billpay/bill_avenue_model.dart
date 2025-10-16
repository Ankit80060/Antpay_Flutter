/*

import 'package:json_annotation/json_annotation.dart';

part 'bill_avenue_model.g.dart';

//verify otp POST body class
@JsonSerializable()
class BillavenuebillfetchRequestModel{

  BillavenuebillfetchRequestModel({
    this.mobile,
    this.biller_category,
    this.billerId,
    this.inputparameter,
  });


  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'biller_category')
  String? biller_category;

  @JsonKey(name: 'billerId')
  String? billerId;

  @JsonKey(name: 'inputparameter')
  String? inputparameter;


  factory BillavenuebillfetchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BillavenuebillfetchRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillavenuebillfetchRequestModelToJson(this);


}

@JsonSerializable()
class BillavenuebillfetchBean {
  BillavenuebillfetchBean({
    this.amount,
    this.billResult,
    this.errormsg,
    this.status,
    this.order_id,
    this.requestId,
    this.customerconveniencefees,
    this.total_amount_to_pay,


  });

  @JsonKey(name: 'amount')
  String? amount;


  @JsonKey(name: 'errormsg')
  String? errormsg;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'order_id')
  String? order_id;

  @JsonKey(name: 'requestId')
  String? requestId;

  @JsonKey(name: 'customerconveniencefees')
  String? customerconveniencefees;

  @JsonKey(name: 'total_amount_to_pay')
  String? total_amount_to_pay;

  @JsonKey(name: 'bill_result')
  BillResults? billResult;




  factory BillavenuebillfetchBean.fromJson(Map<String, dynamic> json) =>
      _$BillavenuebillfetchBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BillavenuebillfetchBeanToJson(this);

}

class BillResults {
  BillResults({
    this.responseCode,
    this.inputParams,
    this.billerResponse,
    this.additionalInfo,
  });
  @JsonKey(name: 'responseCode')
  String? responseCode;

  @JsonKey(name: 'inputParams')
  String? inputParams;

  @JsonKey(name: 'billerResponse')
  String? billerResponse;


  @JsonKey(name: 'billerResponse')
  AdditionalInfo? additionalInfo;



  factory BillResults.fromJson(Map<String, dynamic> json) =>
      _$BillResultsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BillResultsBeanToJson(this);


}



@JsonSerializable()
class AdditionalInfo {
  AdditionalInfo({
    this.billAmount,
    this.billDate,
    this.billNumber,
    this.billPeriod,
    this.customerName,
    this.dueDate,
  });
  @JsonKey(name: 'billAmount')
  String? billAmount;

  @JsonKey(name: 'billDate')
  String? billDate;

  @JsonKey(name: 'billNumber')
  String? billNumber;

  @JsonKey(name: 'billPeriod')
  String? billPeriod;

  @JsonKey(name: 'dueDate')
  String? dueDate;

  @JsonKey(name: 'customerName')
  String? customerName;


  factory AdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);



}







*/
