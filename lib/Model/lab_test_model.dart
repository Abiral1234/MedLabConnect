class LabTestModel{
  String patientName;
  int patientAge;
  String patientAddress;
  String laboratoryTest;
  DateTime labOrderDate;
  String testResult;
  String referenceRange;

  LabTestModel({
    required this.patientName,
    required this.patientAge,
    required this.patientAddress,
    required this.laboratoryTest,
    required this.labOrderDate,
    required this.testResult,
    required this.referenceRange,
  });

  factory LabTestModel.fromJson(Map<String, dynamic> json) {
    return LabTestModel(
      patientName: json['patientName'],
      patientAge: json['patientAge'],
      patientAddress: json['patientAddress'],
      laboratoryTest: json['laboratoryTest'],
      labOrderDate: DateTime.parse(json['labOrderDate']),
      testResult:json['testResult'],
      referenceRange: json['referenceRange']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientName': patientName,
      'patientAge': patientAge,
      'patientAddress': patientAddress,
      'laboratoryTest': laboratoryTest,
      'labOrderDate': labOrderDate.toIso8601String(),
      'testResult':testResult,
      'referenceRange':referenceRange,
    };
  }
}
