import 'package:json_annotation/json_annotation.dart';

part 'transaction_response_model.g.dart';

@JsonSerializable()
class TransactionResponseModel {
  @JsonKey(name: "mobile")
  String? mobile;

  @JsonKey(name: "transaction_no")
  String? transactionNo;

  @JsonKey(name: "amount")
  double? amount;

  @JsonKey(name: "fee_rate")
  double? feeRate;

  @JsonKey(name: "service")
  String? service;

  @JsonKey(name: "channel")
  String? channel;

  @JsonKey(name: "payment_id")
  String? paymentId;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "created_at")
  String? createdAt;

  TransactionResponseModel({
    this.mobile,
    this.transactionNo,
    this.amount,
    this.feeRate,
    this.service,
  });

  Map<String, dynamic> toJson() => _$TransactionResponseModelToJson(this);

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) => _$TransactionResponseModelFromJson(json);
}

@JsonSerializable()
class TransactionRequestModel {
  TransactionRequestModel({
    this.mobile,
    this.date,
    this.transactionNo,
    this.sectionName,
    this.aParam
  });

  @JsonKey(name: "mobile")
  String? mobile;
@JsonKey(name: "aParam")
  String? aParam;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "transaction_no")
  String? transactionNo;

  @JsonKey(name: "section_name")
  String? sectionName;



  Map<String, dynamic> toJson() => _$TransactionRequestModelToJson(this);

  factory TransactionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestModelFromJson(json);
}
