part of 'patient_form_bloc.dart';

@immutable
sealed class PatientFormState {}

final class PatientFormInitial extends PatientFormState {}

final class SendingPatientForm extends PatientFormState {}

// ignore: must_be_immutable
final class PatientFormSent extends PatientFormState {
  LabRequisitionFormModel model;
  PatientFormSent(this.model);
}
