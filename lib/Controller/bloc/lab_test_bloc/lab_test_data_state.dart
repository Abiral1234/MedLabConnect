part of 'lab_test_data_bloc.dart';

@immutable
sealed class LabTestDataState {}

final class LabTestDataInitial extends LabTestDataState {}

final class SubmittingLabTestData extends LabTestDataState {}

final class LabTestDataWasSubmitted extends LabTestDataState {
  LabTestModel labTestModel;
  LabTestDataWasSubmitted(this.labTestModel);
}
