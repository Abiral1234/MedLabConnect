import 'package:bloc/bloc.dart';
import 'package:medlab_connect/Model/LabTestModel.dart';
import 'package:meta/meta.dart';

part 'lab_test_data_event.dart';
part 'lab_test_data_state.dart';

class LabTestDataBloc extends Bloc<LabTestDataEvent, LabTestDataState> {
  LabTestDataBloc() : super(LabTestDataInitial()) {
    on<LabTestDataEvent>((event, emit) {
      // TODO: implement event handler
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
       await Future.delayed(Duration(seconds: 2), () {
         emit(LabTestDataWasSubmitted(model));
      });

      // TODO: implement event handler
    });
  }
}
