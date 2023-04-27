class BloodRequest {
  String bloodType;
  String reason;
  double unitRequired;
  String deadLine;
  String hospital;
  String personInCharge;
  String contactNumber;
  String patientName;
  String? userId;
  BloodRequest({
    required this.bloodType,
    required this.reason,
    required this.unitRequired,
    required this.deadLine,
    required this.hospital,
    required this.personInCharge,
    required this.contactNumber,
    required this.patientName,
    this.userId,
  });

  factory BloodRequest.fromJson(Map<String, dynamic> json) {
    return BloodRequest(
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
