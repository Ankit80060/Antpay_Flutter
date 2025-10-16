
class FetchUserModel {
  String? status;
  String? fname;
  String? lname;
  String? msg;

  FetchUserModel({this.status, this.fname, this.lname, this.msg});

  FetchUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    fname = json['fname'];
    lname = json['lname'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['fname'] = fname;
    data['lname'] = lname;
    data['msg'] = msg;
    return data;
  }
}