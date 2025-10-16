

import 'package:json_annotation/json_annotation.dart';

part 'RentpayAccountDetailsModel.g.dart';

@JsonSerializable()
class RentpayAccountDetailsResponce{
  RentpayAccountDetailsResponce({
    this.status,
    this.beneficiary_id,
    this.msg,
  });

  @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'beneficiary_id')
  dynamic beneficiary_id;

  @JsonKey(name: 'msg')
  String? msg;



  factory RentpayAccountDetailsResponce.fromJson(Map<String, dynamic> json) =>
      _$RentpayAccountDetailsResponceFromJson(json);

  Map<String, dynamic> toJson() => _$RentpayAccountDetailsResponceToJson(this);

}


//to store response of profileUpdate via POST Call

//verify otp POST body class
@JsonSerializable()
class RentpayAccountDetailsRequestModel {


  RentpayAccountDetailsRequestModel({
    this.rent_pay_id,
    this.mobile,
    this.account_no,
    this.c_account_no,
    this.ifsc_code
  });

  @JsonKey(name: 'rent_pay_id')
  String? rent_pay_id;

  @JsonKey(name: ' mobile')
  String? mobile;

  @JsonKey(name: 'account_no')
  String? account_no;

  @JsonKey(name: 'c_account_no')
  String? c_account_no;

  @JsonKey(name: 'ifsc_code')
  String? ifsc_code;


  factory RentpayAccountDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RentpayAccountDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentpayAccountDetailsRequestModelToJson(this);
}

