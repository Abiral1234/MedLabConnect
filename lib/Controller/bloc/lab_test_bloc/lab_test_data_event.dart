part of 'lab_test_data_bloc.dart';

@immutable
sealed class LabTestDataEvent {}

// ignore: must_be_immutable
class LabTestDataSubmitted extends LabTestDataEvent{
  String patientName;
  int patientAge;
  String patientAddress;
  String laboratoryTest;
  DateTime labOrderDate;
  String testResult;
  String referenceRange;
  Function callback;
  LabTestDataSubmitted(
    this.patientName,
    this.patientAge,
    this.patientAddress,
    this.laboratoryTest,
    this.labOrderDate,
    this.testResult,
    this.referenceRange,
    this.callback
  );
}
