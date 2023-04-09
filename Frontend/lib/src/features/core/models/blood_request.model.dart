class BloodRequest {
  String bloodType;
  String reason;
  double unitRequired;
  String deadLine;
  String hospital;
  String personInCharge;
  String contactNumber;
  String patientName;
  String userId;
  BloodRequest({
    required this.bloodType,
    required this.reason,
    required this.unitRequired,
    required this.deadLine,
    required this.hospital,
    required this.personInCharge,
    required this.contactNumber,
    required this.patientName,
    required this.userId,
  });
  toJosn() {
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
