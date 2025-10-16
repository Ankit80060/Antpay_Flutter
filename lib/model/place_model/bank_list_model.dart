import 'package:json_annotation/json_annotation.dart';
part 'bank_list_model.g.dart';

@JsonSerializable()
class Banks{
  Banks({
    this.status,
    this.list,
  });


  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'bank_list')
  List<BankList>? list;

  factory Banks.fromJson(Map<String, dynamic> json) =>
      _$BanksFromJson(json);

  Map<String, dynamic> toJson() => _$BanksToJson(this);
}

@JsonSerializable()
class BankList{
  BankList({
    this.id,
    this.value,
    this.name,
    this.bankCode,
    this.netBanking,
    this.debitCard,
  });


  @JsonKey(name:'id')
  dynamic id;

  @JsonKey(name:'value')
  String? value;

  @JsonKey(name:'name')
  String? name;

  @JsonKey(name:'bank_code')
  String? bankCode;

  @JsonKey(name:'netbanking')
  String? netBanking;

  @JsonKey(name:'debit_card')
  String? debitCard;


  factory BankList.fromJson(Map<String, dynamic> json) =>
      _$BankListFromJson(json);

  Map<String, dynamic> toJson() => _$BankListToJson(this);
}
