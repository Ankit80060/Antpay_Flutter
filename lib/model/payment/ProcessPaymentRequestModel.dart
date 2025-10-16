import 'package:json_annotation/json_annotation.dart';

part 'ProcessPaymentRequestModel.g.dart';

@JsonSerializable()
class ProcessPaymentRequestModel {
  final String amount;
  final String antTrxId;
  final String p3;
  final String p5;
  final String paymentMethod;
  final String payuResponse;
  final int transactionResult;
  final String transactionType;

  ProcessPaymentRequestModel({
    required this.amount,
    required this.antTrxId,
    required this.p3,
    required this.p5,
    required this.paymentMethod,
    required this.payuResponse,
    required this.transactionResult,
    required this.transactionType,
  });

  factory ProcessPaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProcessPaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessPaymentRequestModelToJson(this);
}
