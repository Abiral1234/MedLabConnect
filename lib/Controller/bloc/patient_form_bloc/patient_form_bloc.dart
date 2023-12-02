import 'package:bloc/bloc.dart';
import 'package:medlab_connect/Model/LabRequisitionForm.dart';
import 'package:meta/meta.dart';

part 'patient_form_event.dart';
part 'patient_form_state.dart';

class PatientFormBloc extends Bloc<PatientFormEvent, PatientFormState> {
  PatientFormBloc() : super(PatientFormInitial()) {
    on<PatientFormEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PatientFormSubmitted>((event, emit) async{
      print(state);
      emit(SendingPatientForm());
      print(state);
      LabRequisitionFormModel model = LabRequisitionFormModel(
        patientName: event.patientName,
        patientAge: event.patientAge,
        patientAddress: event.patientAddress,
        laboratoryTest: event.laboratoryTest,
        labOrderDate: event.labOrderDate);
      print(state);
      //I usually Call API and emit state according to the reponse
      //As Ther is no API I am just waiting for 2 Seconds
      
      await Future.delayed(Duration(seconds: 2), () {
         emit(PatientFormSent(model));
      });
     

    });
  }
}
