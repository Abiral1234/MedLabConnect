class LabRequisitionFormModel {
  String patientName;
  int patientAge;
  String patientAddress;
  String laboratoryTest;
  DateTime labOrderDate;

  LabRequisitionFormModel({
    required this.patientName,
    required this.patientAge,
    required this.patientAddress,
    required this.laboratoryTest,
    required this.labOrderDate,
  });

  factory LabRequisitionFormModel.fromJson(Map<String, dynamic> json) {
    return LabRequisitionFormModel(
      patientName: json['patientName'],
      patientAge: json['patientAge'],
      patientAddress: json['patientAddress'],
      laboratoryTest: json['laboratoryTest'],
      labOrderDate: DateTime.parse(json['labOrderDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientName': patientName,
      'patientAge': patientAge,
      'patientAddress': patientAddress,
      'laboratoryTest': laboratoryTest,
      'labOrderDate': labOrderDate.toIso8601String(),
    };
  }
}
