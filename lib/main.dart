import 'package:flutter/material.dart';
import 'Controller/routes/app_route.dart';
void main() {
  runApp(MyApp( appRouter: AppRouter(),));
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  MyApp({super.key,required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedLab Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0XFF87CEEB),
        ),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
