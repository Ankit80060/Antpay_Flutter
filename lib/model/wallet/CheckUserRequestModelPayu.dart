import 'package:json_annotation/json_annotation.dart';

part 'CheckUserRequestModelPayu.g.dart';

@JsonSerializable()
class CheckUserRequestModelPayu {
  @JsonKey(name: 'messageCode')
  String? messageCode;
  @JsonKey(name: 'clientTxnId')
  String? clientTxnId;
  @JsonKey(name: 'aParam')
  String? aParam;
  @JsonKey(name: 'customerMobile')
  String? customerMobile;

  CheckUserRequestModelPayu({this.messageCode,this.clientTxnId, this.aParam, this.customerMobile});

  factory CheckUserRequestModelPayu.fromJson(Map<String, dynamic> json) =>
      _$CheckUserRequestModelPayuFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUserRequestModelPayuToJson(this);
}
