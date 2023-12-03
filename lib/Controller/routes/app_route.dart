import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View/DoctorView/doctor_view.dart';
import '../../View/DoctorView/lab_requisition_form.dart';
import '../../View/LabView/lab_test_page.dart';
import '../bloc/lab_test_bloc/lab_test_data_bloc.dart';
import '../bloc/patient_form_bloc/patient_form_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const DoctorView(
              title: 'MedLab Connect',
            ),);

      case '/patientForm':
      final arguments = routeSettings.arguments;
      if (arguments != null && arguments is Function) {
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
          create: (context) => PatientFormBloc(),
          child: LabRequisitionForm(
          callback: arguments,
          ),
        ),
        );
        }
        // Handle the case where the arguments are not as expected
        // You might want to navigate to an error page or do something else
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
        body: Center(
          child: Text('Invalid arguments for /patientForm'),
        ),
        ),
      );

      case '/labTestPage':
      final arguments = routeSettings.arguments;
      if (arguments != null && arguments is Map<String, dynamic>) {
      final patientDataModel = arguments['patientDataModel'];
      final callback = arguments['callback'];
      if (patientDataModel != null && callback is Function) {
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LabTestDataBloc(),
            child: LabTestPage(
              patientDataModel: patientDataModel,
              callback: callback,
              ),
            ),
          );
       }
      }
      return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
        child: Text('Invalid arguments for /labTestPage'),
        ),
      ),
      );
      default:
        return MaterialPageRoute(
            builder: (_) => const DoctorView(
              title: 'MedLab Connect',
            ),);
    }
  }
}