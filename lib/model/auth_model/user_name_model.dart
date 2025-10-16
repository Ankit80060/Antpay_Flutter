import 'package:json_annotation/json_annotation.dart';

part 'user_name_model.g.dart';

@JsonSerializable()
class UsernameRequest {
  UsernameRequest({this.mobile});

  @JsonKey(name: 'mobile')
  String? mobile;

  factory UsernameRequest.fromJson(Map<String, dynamic> json) =>
      _$UsernameRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameRequestToJson(this);
}

@JsonSerializable()
class UsernameResponse {
  /*
  "status":"1","fname":"","lname":"","name":"a*********y","encryptedName":"YW1hbiBwYW5kZXk=","msg":"found"
   */
  UsernameResponse({this.lname, this.fname, this.status, this.msg, this.encryptedName,this.name});

  @JsonKey(name: 'lname')
  String? lname;
    @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'encryptedName')
  String? encryptedName;

  @JsonKey(name: 'fname')
  String? fname;

  factory UsernameResponse.fromJson(Map<String, dynamic> json) =>
      _$UsernameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameResponseToJson(this);
}
