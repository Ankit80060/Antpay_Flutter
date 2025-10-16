
class BillerResponse {
  int status;
  String msg;
  List<Biller> billers;

  BillerResponse({required this.status, required this.msg, required this.billers});

  factory BillerResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> billerList = json['billers'];
    List<Biller> billers = billerList.map((item) => Biller.fromJson(item)).toList();

    return BillerResponse(
      status: json['status'],
      msg: json['msg'],
      billers: billers,
    );
  }
}

class Biller {
  String id;
  String billerCategory;
  String billerName;
  String billerId;
  bool billerAdhoc;
  String billerCoverage;
  String billerFetchRequiremet;
  String billerPaymentExactness;

  Biller({
    required this.id,
    required this.billerCategory,
    required this.billerName,
    required this.billerId,
    required this.billerAdhoc,
    required this.billerCoverage,
    required this.billerFetchRequiremet,
    required this.billerPaymentExactness,
  });

  factory Biller.fromJson(Map<String, dynamic> json) {
    return Biller(
      id: json['id'],
      billerCategory: json['billerCategory'],
      billerName: json['billerName'],
      billerId: json['billerId'],
      billerAdhoc: json['billerAdhoc'] == "true",
      billerCoverage: json['billerCoverage'],
      billerFetchRequiremet: json['billerFetchRequiremet'],
      billerPaymentExactness: json['billerPaymentExactness'],
    );
  }
}
