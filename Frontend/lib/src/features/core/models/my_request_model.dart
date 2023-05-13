List<MyRequest> myRequestFromJson(dynamic str) =>
    List<MyRequest>.from((str).map((x) => MyRequest.fromJson(x)));

class MyRequest {
  String? requestId;
  String bloodType;
  String reason;
  double unitRequired;
  String deadLine;
  String hospital;
  String? personInCharge;
  String contactNumber;
  String patientName;
  String? userId;
  MyRequest({
    this.requestId,
    required this.bloodType,
    required this.reason,
    required this.unitRequired,
    required this.deadLine,
    required this.hospital,
    this.personInCharge,
    required this.contactNumber,
    required this.patientName,
    this.userId,
  });

  factory MyRequest.fromJson(Map<String, dynamic> json) {
    return MyRequest(
      requestId: json["requestId"],
      bloodType: json["bloodType"],
      reason: json["reason"],
      unitRequired: json["unitRequired"],
      deadLine: json["deadLine"],
      hospital: json["hospital"],
      personInCharge: json["personInCharge"],
      contactNumber: json["contactNumber"],
      patientName: json["patientName"],
      userId: json["userId"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "requestId": requestId,
      "bloodType": bloodType,
      "reason": reason,
      "unitRequired": unitRequired,
      "deadLine": deadLine,
      "hospital": hospital,
      "personInCharge": personInCharge,
      "contactNumber": contactNumber,
      "patientName": patientName,
      "userId": userId,
    };
  }
}