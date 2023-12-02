part of 'patient_form_bloc.dart';

@immutable
sealed class PatientFormEvent {}

class PatientFormSubmitted extends PatientFormEvent{
  String patientName;
  int patientAge;
  String patientAddress;
  String laboratoryTest;
  DateTime labOrderDate;
  Function callback;
  PatientFormSubmitted(
    this.patientName,
    this.patientAge,
    this.patientAddress,
    this.laboratoryTest,
    this.labOrderDate,
    this.callback
  );


}
