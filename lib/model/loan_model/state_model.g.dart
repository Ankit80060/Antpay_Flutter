// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateResponse _$StateResponseFromJson(Map<String, dynamic> json) =>
    StateResponse(
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => StateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StateResponseToJson(StateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

StateData _$StateDataFromJson(Map<String, dynamic> json) => StateData(
      id: json['id'] as String,
      numStateCd: json['num_state_cd'] as String,
      txtState: json['txt_state'] as String,
      numRegionCd: json['num_region_cd'] as String,
      txtRegion: json['txt_region'] as String,
    );

Map<String, dynamic> _$StateDataToJson(StateData instance) => <String, dynamic>{
      'id': instance.id,
      'num_state_cd': instance.numStateCd,
      'txt_state': instance.txtState,
      'num_region_cd': instance.numRegionCd,
      'txt_region': instance.txtRegion,
    };
