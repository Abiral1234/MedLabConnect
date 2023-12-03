// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:medlab_connect/Model/lab_requisition_form_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'patient_form_event.dart';
part 'patient_form_state.dart';

class PatientFormBloc extends Bloc<PatientFormEvent, PatientFormState> {
  PatientFormBloc() : super(PatientFormInitial()) {
    on<PatientFormEvent>((event, emit) {
    });
    on<PatientFormSubmitted>((event, emit) async{
      emit(SendingPatientForm());
      LabRequisitionFormModel model = LabRequisitionFormModel(
        patientName: event.patientName,
        patientAge: event.patientAge,
        patientAddress: event.patientAddress,
        laboratoryTest: event.laboratoryTest,
        labOrderDate: event.labOrderDate);
      //I usually Call API and emit state according to the reponse
      //As Ther is no API I am just waiting for 2 Seconds
      
      await Future.delayed(const Duration(seconds: 2), () {
         emit(PatientFormSent(model));
      });
     

    });
  }
}
