
import 'package:json_annotation/json_annotation.dart';
part 'redemption_status_model.g.dart';

@JsonSerializable()
class RedemptionStatusRequestModel{
  RedemptionStatusRequestModel({
    this.phone,
    this.investment_no,
    this.source
});

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"investment_no")
  String? investment_no;

  @JsonKey(name:'source')
  String? source;

  factory RedemptionStatusRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionStatusRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedemptionStatusRequestModelToJson(this);

}

@JsonSerializable()
class RedemptionStatusResponseModel{
  RedemptionStatusResponseModel({
    this.status,
    this.message

});

  @JsonKey(name:"status")
  dynamic? status;

  @JsonKey(name:"mes")
  String? message;

  factory RedemptionStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionStatusResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedemptionStatusResponseModelToJson(this);



}