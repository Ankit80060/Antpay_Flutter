import 'package:json_annotation/json_annotation.dart';

import '../../prefrences/session_manager.dart';
import '../../utils/app_constant.dart';


part 'FetchBillBean.g.dart';

//verify otp POST body class
@JsonSerializable()
class FetchBillRequestModel{

  FetchBillRequestModel({
    this.number,
    this.Operator_Code
  });

  @JsonKey(name: 'number')
  String? number;

  @JsonKey(name:'aParam')
  String? aParam = AppConstant.generateAuthParam(SessionManager().getMobile().toString());

  @JsonKey(name: 'Operator_Code')
  String? Operator_Code;


  factory FetchBillRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FetchBillRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$FetchBillRequestModelToJson(this);

}

@JsonSerializable()
class FetchBillBean {
  FetchBillBean({
    this.amount,
    this.addinfo,
    this.errormsg,
    this.status,
  });


  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'addinfo')
  @_AddInfoConverter()
  AddInfo? addinfo;


  @JsonKey(name: 'errormsg')
  String? errormsg;

  @JsonKey(name: 'status')
  String? status;


  factory FetchBillBean.fromJson(Map<String, dynamic> json) =>
      _$FetchBillBeanFromJson(json);

  Map<String, dynamic> toJson() => _$FetchBillBeanToJson(this);

}

@JsonSerializable(explicitToJson: true)
class AddInfo {
  AddInfo({
    this.bill_number,
    this.due_date,
     this.bill_date,
    this.bill_amount,
    this.bill_customer,
    this.bill_partial,
});
  @JsonKey(name: 'bill_number')
  String? bill_number;

  @JsonKey(name: 'due_date')
  String? due_date;
   @JsonKey(name: 'bill_date')
  String? bill_date;

  @JsonKey(name: 'bill_amount')
  String? bill_amount;

  @JsonKey(name: 'bill_customer')
  String? bill_customer;

  @JsonKey(name: 'bill_partial')
  String? bill_partial;


  factory AddInfo.fromJson(Map<String, dynamic> json) =>
      _$AddInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AddInfoToJson(this);


}


/// Converter that handles "NA"
class _AddInfoConverter implements JsonConverter<AddInfo?, dynamic> {
  const _AddInfoConverter();

  @override
  AddInfo? fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return AddInfo.fromJson(json);
    }
    return null; // if "NA" or null
  }

  @override
  dynamic toJson(AddInfo? object) => object?.toJson();
}



