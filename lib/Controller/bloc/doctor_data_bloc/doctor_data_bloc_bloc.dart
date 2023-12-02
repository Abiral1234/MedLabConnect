import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/LabTestModel.dart';

part 'doctor_data_bloc_event.dart';
part 'doctor_data_bloc_state.dart';

class DoctorDataBlocBloc extends Bloc<DoctorDataBlocEvent, DoctorDataBlocState> {
  DoctorDataBlocBloc() : super(DoctorDataBlocInitial()) {
    on<DoctorDataBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetDoctorData>((event, emit) {
      print(event.model.patientName);
      print(event.model.patientAddress);
     print(event.model.patientAge);
    //  emit(ShowDataInDoctorView(
    //   event.model
    //  ));
    });
  }
}
