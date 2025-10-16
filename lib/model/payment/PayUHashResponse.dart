import 'package:json_annotation/json_annotation.dart';
part 'PayUHashResponse.g.dart';

@JsonSerializable()
  class PayUHashResponse  {

  PayUHashResponse({
    this.status,
    this.paymentHash,
    this.paymentHash1,
    this.paymentHash2,
    this.paymentHash3,

  });

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'payment_hash')
  String? paymentHash;

  @JsonKey(name: 'payment_hash1')
  String? paymentHash1;

  @JsonKey(name: 'payment_hash2')
  String? paymentHash2;

  @JsonKey(name: 'payment_hash3')
  String? paymentHash3;


  factory PayUHashResponse.fromJson(Map<String, dynamic> json) =>
      _$PayUHashResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PayUHashResponseToJson(this);
}

