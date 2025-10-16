import 'package:json_annotation/json_annotation.dart';

part 'PayUStringHash.g.dart';

@JsonSerializable()
class PayUStringHash {
  @JsonKey(name: 'pipe_string_value')
  String? pipeStringValue;

  @JsonKey(name: 'pipe_string_value1')
  String? pipeStringValue1;

  @JsonKey(name: 'pipe_string_value2')
  String? pipeStringValue2;

  @JsonKey(name: 'pipe_string_value3')
  String? pipeStringValue3;

  PayUStringHash({
    this.pipeStringValue,
    this.pipeStringValue1,
    this.pipeStringValue2,
    this.pipeStringValue3,
  });

  factory PayUStringHash.fromJson(Map<String, dynamic> json) =>
      _$PayUStringHashFromJson(json);

  Map<String, dynamic> toJson() => _$PayUStringHashToJson(this);
}
