part of 'doctor_data_bloc_bloc.dart';

@immutable
sealed class DoctorDataBlocState {}

final class DoctorDataBlocInitial extends DoctorDataBlocState {}

final class ShowDataInDoctorView extends DoctorDataBlocState{
   LabTestModel model;
   ShowDataInDoctorView(this.model);
}