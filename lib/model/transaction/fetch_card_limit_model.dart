import 'package:json_annotation/json_annotation.dart';

part 'fetch_card_limit_model.g.dart';

/// Request Model
@JsonSerializable()
class FetchCardLimitReqModel {
  @JsonKey(name: 'customerId')
  String? customerId;

  @JsonKey(name: 'urn')
  String? urn;

  @JsonKey(name: 'aParam')
  String? aParam;

  FetchCardLimitReqModel({
    this.customerId,
    this.urn,
    this.aParam,
  });

  factory FetchCardLimitReqModel.fromJson(Map<String, dynamic> json) =>
      _$FetchCardLimitReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FetchCardLimitReqModelToJson(this);
}

/// Response Model
@JsonSerializable()
class FetchCardLimitResModel {
  @JsonKey(name: 'responseCode')
  int? responseCode;

  @JsonKey(name: 'responseMessage')
  String? responseMessage;

  @JsonKey(name: 'responseDateTime')
  String? responseDateTime;

  FetchCardLimitResModel({
    this.responseCode,
    this.responseMessage,
    this.responseDateTime,
  });

  factory FetchCardLimitResModel.fromJson(Map<String, dynamic> json) =>
      _$FetchCardLimitResModelFromJson(json);

  Map<String, dynamic> toJson() => _$FetchCardLimitResModelToJson(this);
}
