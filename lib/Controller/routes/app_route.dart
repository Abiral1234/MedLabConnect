import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlab_connect/Controller/bloc/doctor_data_bloc/doctor_data_bloc_bloc.dart';

import '../../View/DoctorView/DoctorView.dart';
import '../../View/DoctorView/LabRequisitionFormPage.dart';
import '../../View/LabView/LabTestPage.dart';
import '../bloc/lab_test_bloc/lab_test_data_bloc.dart';
import '../bloc/patient_form_bloc/patient_form_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
        create: (context) => DoctorDataBlocBloc(),
        child: DoctorView(
          title: 'MedLab Connect',
        ),
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
        builder: (_) => Scaffold(
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
      builder: (_) => Scaffold(
        body: Center(
        child: Text('Invalid arguments for /labTestPage'),
        ),
      ),
      );

  // Handle the case where the arguments are not as expected
  // You might want to navigate to an error page or do something else
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('Invalid arguments for /labTestPage'),
      ),
    ),
  );


      // case 'login':
      //   return MaterialPageRoute(builder: (_) => const Login());
      // case 'signup':
      //   return MaterialPageRoute(builder: (_) => const SignUp());

      // case 'home':
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //           create: (context) => MainpageCubit(), child: const Home()));
      // case 'transaction':
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => TransactionsCubit(),
      //             child: Transactions(),
      //           ));
      // case 'bargainHistory':
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => BargainHistoryBloc(),
      //             child: BargainHistory(),
      //           ));
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
        create: (context) => DoctorDataBlocBloc(),
        child: DoctorView(
          title: 'MedLab Connect',
        ),
      ),);
    }
  }
}