// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banks _$BanksFromJson(Map<String, dynamic> json) => Banks(
      status: json['status'],
      list: (json['bank_list'] as List<dynamic>?)
          ?.map((e) => BankList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BanksToJson(Banks instance) => <String, dynamic>{
      'status': instance.status,
      'bank_list': instance.list,
    };

BankList _$BankListFromJson(Map<String, dynamic> json) => BankList(
      id: json['id'],
      value: json['value'] as String?,
      name: json['name'] as String?,
      bankCode: json['bank_code'] as String?,
      netBanking: json['netbanking'] as String?,
      debitCard: json['debit_card'] as String?,
    );

Map<String, dynamic> _$BankListToJson(BankList instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'name': instance.name,
      'bank_code': instance.bankCode,
      'netbanking': instance.netBanking,
      'debit_card': instance.debitCard,
    };
