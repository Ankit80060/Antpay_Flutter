// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleList _$CircleListFromJson(Map<String, dynamic> json) => CircleList(
      result: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CircleListToJson(CircleList instance) =>
    <String, dynamic>{
      'results': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as String?,
      circle: json['circle'] as String?,
      circle_code: json['circle_code'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'circle': instance.circle,
      'circle_code': instance.circle_code,
    };
