import 'package:json_annotation/json_annotation.dart';

part 'change_wallet_status_model.g.dart';

@JsonSerializable()
class ChangeWalletStatusResponse {
  final String responseCode;
  final String responseDateTime;
  final String responseMessage;

  ChangeWalletStatusResponse({
    required this.responseCode,
    required this.responseDateTime,
    required this.responseMessage,
  });

  factory ChangeWalletStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeWalletStatusResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ChangeWalletStatusResponseToJson(this);
}
