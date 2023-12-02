part of 'doctor_data_bloc_bloc.dart';

@immutable
sealed class DoctorDataBlocEvent {}

class GetDoctorData extends DoctorDataBlocEvent{
  LabTestModel model;
  GetDoctorData(
    this.model
  );
}