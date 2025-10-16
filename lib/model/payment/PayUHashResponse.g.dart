// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayUHashResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayUHashResponse _$PayUHashResponseFromJson(Map<String, dynamic> json) =>
    PayUHashResponse(
      status: json['status'] as String?,
      paymentHash: json['payment_hash'] as String?,
      paymentHash1: json['payment_hash1'] as String?,
      paymentHash2: json['payment_hash2'] as String?,
      paymentHash3: json['payment_hash3'] as String?,
    );

Map<String, dynamic> _$PayUHashResponseToJson(PayUHashResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'payment_hash': instance.paymentHash,
      'payment_hash1': instance.paymentHash1,
      'payment_hash2': instance.paymentHash2,
      'payment_hash3': instance.paymentHash3,
    };
