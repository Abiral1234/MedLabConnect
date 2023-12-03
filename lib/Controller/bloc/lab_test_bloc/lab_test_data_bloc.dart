// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:medlab_connect/Model/lab_test_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'lab_test_data_event.dart';
part 'lab_test_data_state.dart';

class LabTestDataBloc extends Bloc<LabTestDataEvent, LabTestDataState> {
  LabTestDataBloc() : super(LabTestDataInitial()) {
    on<LabTestDataEvent>((event, emit) {
    });
    on<LabTestDataSubmitted>((event, emit) async{
      emit(SubmittingLabTestData());
      LabTestModel model = LabTestModel(
        patientName: event.patientName,
        patientAge: event.patientAge,
        patientAddress: event.patientAddress,
        laboratoryTest: event.laboratoryTest,
        labOrderDate: event.labOrderDate,
        testResult: event.testResult,
        referenceRange: event.referenceRange);
       await Future.delayed(const Duration(seconds: 2), () {
         emit(LabTestDataWasSubmitted(model));
      });
    });
  }
}
