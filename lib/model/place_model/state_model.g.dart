// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      status: (json['status'] as num?)?.toInt(),
      stateList: (json['state_list'] as List<dynamic>?)
          ?.map((e) => StateList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'state_list': instance.stateList,
    };

StateList _$StateListFromJson(Map<String, dynamic> json) => StateList(
      state: json['state'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$StateListToJson(StateList instance) => <String, dynamic>{
      'state': instance.state,
      'code': instance.code,
    };
