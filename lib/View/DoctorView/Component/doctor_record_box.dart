// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorRecord extends StatelessWidget {
  int index;
  String patientName;
  int patientAge;
  String patientAddress;
  String laboratoryTest;
  DateTime labOrderDate;
  String testResult;
  String rangeReference;

  DoctorRecord(
      {super.key,
      required this.index,
      required this.patientName,
      required this.patientAge,
      required this.patientAddress,
      required this.laboratoryTest,
      required this.labOrderDate,
      required this.testResult,
      required this.rangeReference});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
        height: 260,
        width: screenWidth,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            border: Border.all(color: Theme.of(context).colorScheme.inversePrimary,),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Id :#$index"),
                const SizedBox(height: 5),
                Text('Patient’s name : $patientName'),
                const SizedBox(height: 5),
                Text('Patient’s age: ${patientAge.toString()} years'),
                const SizedBox(height: 5),
                Text('Patient’s address: $patientAddress'),
                const SizedBox(height: 5),
                Text('Lab Test: $laboratoryTest'),
                const SizedBox(height: 5),
                Text('Test Result: $testResult'),
                const SizedBox(height: 5),
                Text('Range Reference: $rangeReference'),
                const SizedBox(height: 5),
                Text('Date: ${labOrderDate.year.toString()}-${labOrderDate.month.toString()}-${labOrderDate.day.toString()}',
                style: const TextStyle(color: Colors.grey),),
              ]),
        ),
      ),
    );
  }
}
