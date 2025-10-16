import 'package:json_annotation/json_annotation.dart';

part 'get_payment_pin_model.g.dart';

@JsonSerializable()
class GetPaymentPinResponse {
  final String status;
  final String pin;
  final String msg;

  GetPaymentPinResponse({
    required this.status,
    required this.pin,
    required this.msg,
  });

  factory GetPaymentPinResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentPinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentPinResponseToJson(this);
}
