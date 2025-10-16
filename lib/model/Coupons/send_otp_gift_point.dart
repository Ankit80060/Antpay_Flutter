import 'package:json_annotation/json_annotation.dart';

part 'send_otp_gift_point.g.dart';

@JsonSerializable()
class GetGiftOtpResponse {
  @JsonKey(name: 'status')
  // @StringOrIntToIntConverter()
  final dynamic status;

  @JsonKey(name: 'msg')
  final String msg;

  GetGiftOtpResponse({
    required this.status,
    required this.msg,
  });

  factory GetGiftOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGiftOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGiftOtpResponseToJson(this);
}

class StringOrIntToIntConverter implements JsonConverter<String?, dynamic> {
  const StringOrIntToIntConverter();

  @override
  String fromJson(dynamic json) {
    if (json == null) return '';
    return json.toString();
  }

  @override
  dynamic toJson(String? object) => object;
}

// Verify Otp Response

@JsonSerializable()
class GetVerifyGiftOtpResponse {
  final String status;
  final String msg;

  GetVerifyGiftOtpResponse({
    required this.status,
    required this.msg,
  });

  factory GetVerifyGiftOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVerifyGiftOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVerifyGiftOtpResponseToJson(this);
}
