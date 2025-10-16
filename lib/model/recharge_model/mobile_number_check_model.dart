

import 'package:json_annotation/json_annotation.dart';

part 'mobile_number_check_model.g.dart';

@JsonSerializable()
class MobileNumberCheckRequestModel{
  MobileNumberCheckRequestModel({
    this.mobile,
    this.aParam
});

  @JsonKey(name:'mobile')
  String? mobile;

  @JsonKey(name:'aParam')
  String? aParam;

  factory MobileNumberCheckRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MobileNumberCheckRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$MobileNumberCheckRequestModelToJson(this);


}

@JsonSerializable()
class MobileNumberCheckResponseModel{
  MobileNumberCheckResponseModel({
    this.number,
    this.company,
    this.state,
    this.ported,
    this.transactionId,
    this.status,
    this.utransactionId,
    this.resposneMessage,
});

  @JsonKey(name:'Number')
  String? number;

  @JsonKey(name:'company')
  String? company;

  @JsonKey(name:'state')
  String? state;

  @JsonKey(name:'ported')
  dynamic ported;

  @JsonKey(name:'TransactionID')
  dynamic transactionId;

  @JsonKey(name:'UtransactionID')
  String? utransactionId;

  @JsonKey(name:'Status')
  dynamic status;

  @JsonKey(name:'ResposneMessage')
  String? resposneMessage;

  factory MobileNumberCheckResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MobileNumberCheckResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MobileNumberCheckResponseModelToJson(this);

}