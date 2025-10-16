import 'package:json_annotation/json_annotation.dart';

part 'SetMpinModel.g.dart';

@JsonSerializable()
class SetMPinResponse {
  @JsonKey(name: 'responseCode')
  final String responseCode;

  @JsonKey(name: 'messageCode')
  @StringConverter()
  final String messageCode;

  @JsonKey(name: 'clientTxnId')
  final String clientTxnId;

  @JsonKey(name: 'responseDateTime')
  final String responseDateTime;

  @JsonKey(name: 'responseMessage')
  final String responseMessage;

  @JsonKey(name: 'token')
   @StringConverter()
  final String token;

  @JsonKey(name: 'deviceId')
   @StringConverter()
  final String deviceId;

  @JsonKey(name: 'tokenExpiryTime')
   @StringConverter()
  final String tokenExpiryTime;

  @JsonKey(name: 'mpinExpiryTime')
   @StringConverter()
  final String mpinExpiryTime;

  SetMPinResponse({
    required this.responseCode,
    required this.messageCode,
    required this.clientTxnId,
    required this.responseDateTime,
    required this.responseMessage,
    required this.token,
    required this.deviceId,
    required this.tokenExpiryTime,
    required this.mpinExpiryTime,
  });

  factory SetMPinResponse.fromJson(Map<String, dynamic> json) =>
      _$SetMPinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SetMPinResponseToJson(this);
}

class StringConverter implements JsonConverter<String, dynamic> {
  const StringConverter();

  @override
  String fromJson(dynamic json) {
    if (json == null) return ""; 
    return json.toString();      
  }

  @override
  dynamic toJson(String object) => object;
}


@JsonSerializable()
class SetMPinRequest {
  @JsonKey(name: 'customerMobile')
  final String customerMobile;

  @JsonKey(name: 'newMpin')
  final String newMpin;

  @JsonKey(name: 'oldMPin')
  final String oldMPin;

  @JsonKey(name: 'otp')
  final String otp;

  @JsonKey(name: 'action')
  final String action;

  @JsonKey(name: 'deviceId')
  final String deviceId;
@JsonKey(name: 'aParam')
  final String aParam;

  SetMPinRequest({
    required this.aParam,
    required this.customerMobile,
    required this.newMpin,
    required this.oldMPin,
    required this.otp,
    required this.action,
    required this.deviceId,
  });

  factory SetMPinRequest.fromJson(Map<String, dynamic> json) =>
      _$SetMPinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetMPinRequestToJson(this);
}

