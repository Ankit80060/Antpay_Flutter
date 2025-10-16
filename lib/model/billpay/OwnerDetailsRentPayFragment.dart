
import 'package:json_annotation/json_annotation.dart';

part 'OwnerDetailsRentPayFragment.g.dart';

@JsonSerializable()
class OwnerDetailsRentPayFragmentModel{
  OwnerDetailsRentPayFragmentModel({
    this.status,
    this.rent_pay_id,
    this.msg,
  });

  @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'rent_pay_id')
  dynamic rent_pay_id;

  @JsonKey(name: 'msg')
  String? msg;



  factory OwnerDetailsRentPayFragmentModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerDetailsRentPayFragmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerDetailsRentPayFragmentModelToJson(this);

}


//to store response of profileUpdate via POST Call

//verify otp POST body class
@JsonSerializable()
class OwnerDetailsRentPayFragmentRequestModel {

  OwnerDetailsRentPayFragmentRequestModel({
    this.mobile,
    this.owner_mobile,
    this.name,
    this.amount,
    this.month,
    this.address
  });

  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'owner_mobile')
  String? owner_mobile;

  @JsonKey(name: 'name')
  String? name;


  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'month')
  String? month;

  @JsonKey(name: 'address')
  String? address;

  factory OwnerDetailsRentPayFragmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerDetailsRentPayFragmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerDetailsRentPayFragmentRequestModelToJson(this);
}
