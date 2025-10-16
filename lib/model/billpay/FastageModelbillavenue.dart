import 'package:json_annotation/json_annotation.dart';

part 'FastageModelbillavenue.g.dart';

//verify otp POST body class
@JsonSerializable()
class FastageModelbillavenueModel{
  FastageModelbillavenueModel({
    this.mobile,
    this.biller_category,
    this.billerId,
    this.inputparameter
  });

  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'biller_category')
  String? biller_category;

  @JsonKey(name: 'billerId')
  String? billerId;

  @JsonKey(name: 'inputparameter')
  dynamic? inputparameter;


  factory FastageModelbillavenueModel.fromJson(Map<String, dynamic> json) =>
      _$FastageModelbillavenueModelFromJson(json);

  Map<String, dynamic> toJson() => _$FastageModelbillavenueModelToJson(this);


}


// @JsonSerializable()
// class FetchBillBeanFastage {

@JsonSerializable()
class FetchBillBeanFastage {
  final int? status;
  final String? msg;
  @JsonKey(name: 'order_id')
  final String? orderId;
  final String? requestId;
  @JsonKey(name: 'bill_result')
  final BillResult? billResult;
  final int? customerconveniencefees;
  @JsonKey(name: 'total_amount_to_pay')
  final int? totalAmountToPay;

  FetchBillBeanFastage({
    required this.status,
    required this.msg,
    required this.orderId,
    required this.requestId,
    required this.billResult,
    required this.customerconveniencefees,
    required this.totalAmountToPay,
  });

  factory FetchBillBeanFastage.fromJson(Map<String, dynamic> json) =>
      _$FetchBillBeanFastageFromJson(json);
  Map<String, dynamic> toJson() => _$FetchBillBeanFastageToJson(this);
}

@JsonSerializable()
class BillResult {
  final String? responseCode;
  dynamic inputParams;
  final GetBillerResponse? billerResponse;
  final AdditionalInfo? additionalInfo;

  BillResult({
    required this.responseCode,
    this.inputParams,//required this.inputParams,
    required this.billerResponse,
    required this.additionalInfo,
  });

  factory BillResult.fromJson(Map<String, dynamic> json) =>
      _$BillResultFromJson(json);
  Map<String, dynamic> toJson() => _$BillResultToJson(this);
}

@JsonSerializable()
class InputParams {
  final List<Input?> input;

  InputParams({required this.input});

  factory InputParams.fromJson(Map<String, dynamic> json) =>
      _$InputParamsFromJson(json);
  Map<String, dynamic> toJson() => _$InputParamsToJson(this);
}

@JsonSerializable()
class Input {
  final String? paramName;
  final String? paramValue;

  Input({
    required this.paramName,
    required this.paramValue,
  });

  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);
  Map<String, dynamic> toJson() => _$InputToJson(this);
}

@JsonSerializable()
class GetBillerResponse {
  //final int? billAmount;
  dynamic billAmount;
  final String? billNumber;
  final String? customerName;
  final String? billDate;
  final String? dueDate;
  final String? billPeriod;

  GetBillerResponse({
    this.billPeriod,
    required this.billAmount,
    required this.billNumber,
    required this.customerName,
    this.billDate,
    this.dueDate
  });

  factory GetBillerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBillerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBillerResponseToJson(this);
}

@JsonSerializable()
class AdditionalInfo {
  final List<Info>? info;

  AdditionalInfo({required this.info});

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}

@JsonSerializable()
class Info {
  final String? infoName;
  final String? infoValue;

  Info({
    required this.infoName,
    required this.infoValue,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
