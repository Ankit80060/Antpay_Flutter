
import 'package:json_annotation/json_annotation.dart';

part 'user_bank_account_model.g.dart';

@JsonSerializable()
class UserBankAccountRequestModel{

  UserBankAccountRequestModel({
    this.lender_id,
    this.phone,
    this.fullname,
    this.account_number,
    this.confirm_acc_number,
    this.ifscCode,
    this.source
});

  @JsonKey(name: 'lender_id')
  String? lender_id;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'fullname')
  String? fullname;

  @JsonKey(name:'account_no')
  String? account_number;

  @JsonKey(name: 'caccount_no')
  String? confirm_acc_number;

  @JsonKey(name: 'ifsc_code')
  String? ifscCode;

  @JsonKey(name: 'source')
  String? source;

  factory UserBankAccountRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserBankAccountRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBankAccountRequestModelToJson(this);

}

@JsonSerializable()
class UserBankAccountResponseModel{

  UserBankAccountResponseModel({
    this.status,
    this.lender_id,
    this.msg
});

  @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'lender_id')
  String? lender_id;

  @JsonKey(name:'msg')
  String? msg;

  factory UserBankAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserBankAccountResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBankAccountResponseModelToJson(this);


}