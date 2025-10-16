import 'package:json_annotation/json_annotation.dart';


part 'CheckUserResponseModel.g.dart';

@JsonSerializable()
class CheckUserResponseModel {
  String? code;
  @JsonKey(name: 'status_code')
  String? statusCode;
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;
  @JsonKey(name: 'kyc_status')
  String? kycStatus;
  @JsonKey(name: 'wallet_status')
  String? walletStatus;
  String? message;
  String? name;
  @JsonKey(name: 'DOB')
  String? dOB;
  String? address;

  CheckUserResponseModel();

  factory CheckUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckUserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUserResponseModelToJson(this);
}

