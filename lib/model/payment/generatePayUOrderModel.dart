import 'package:json_annotation/json_annotation.dart';

part 'generatePayUOrderModel.g.dart';

//verify otp POST body class
@JsonSerializable()
class GeneratePayUOrderModel {
  GeneratePayUOrderModel(
      {this.amount, this.mobile, this.service, this.channel, required source});

  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'service')
  String? service;

  @JsonKey(name: 'channel')
  String? channel;

  @JsonKey(name: 'source')
  String? source="Antpay";

  factory GeneratePayUOrderModel.fromJson(Map<String, dynamic> json) =>
      _$GeneratePayUOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratePayUOrderModelToJson(this);
}

@JsonSerializable()
class GeneratePayUOrderModelBean {
  @JsonKey(name: 'status')
  @StringOrIntToIntConverter()
  String? status;

  @JsonKey(name: 'ant_txn_id')
  String? antTxnId;

  @JsonKey(name: 'fee')
  dynamic fee;

  @JsonKey(name: 'amount')
  dynamic amount;

  @JsonKey(name: 'final_amount')
  dynamic finalAmount;

  @JsonKey(name: 'order_id')
  String? orderId;

  @JsonKey(name: 'api_key')
  String? apiKey;

  @JsonKey(name: 'payu_salt')
  String? salt;

  @JsonKey(name: 'pg_type')
  String? pgType;

  @JsonKey(name: 'channel')
  String? channel;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'p_kyc')
  String? pKyc;

  @JsonKey(name: 'error_msg')
  String? errorMsg;

  GeneratePayUOrderModelBean({
    this.status,
    this.antTxnId,
    this.fee,
    this.amount,
    this.finalAmount,
    this.orderId,
    this.apiKey,
    this.salt,
    this.pgType,
    this.channel,
    this.msg,
    this.pKyc,
    this.errorMsg,
  });

  factory GeneratePayUOrderModelBean.fromJson(Map<String, dynamic> json) =>
      _$GeneratePayUOrderModelBeanFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratePayUOrderModelBeanToJson(this);
}

class StringOrIntToIntConverter implements JsonConverter<String?, dynamic> {
  const StringOrIntToIntConverter();

  @override
  String? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is int) return json.toString();
    if (json is String) return json;
    return null;
  }

  @override
  dynamic toJson(String? object) => object;
}

