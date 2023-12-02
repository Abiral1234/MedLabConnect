
import 'package:flutter/material.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Id :#${index}"),
                SizedBox(height: 5),
                Text('Patient’s name :' + patientName),
                SizedBox(height: 5),
                Text('Patient’s age: ' + patientAge.toString() + ' years'),
                SizedBox(height: 5),
                Text('Patient’s address:' + patientAddress),
                SizedBox(height: 5),
                Text('Lab Test: ' + laboratoryTest),
                SizedBox(height: 5),
                Text('Test Result: ' + testResult),
                SizedBox(height: 5),
                Text('Range Reference: ' + rangeReference),
                SizedBox(height: 5),
                Text(labOrderDate.year.toString()
                +'-' + labOrderDate.month.toString() 
                +'-'+ labOrderDate.day.toString(),
                style: TextStyle(color: Colors.grey),),
              ]),
        ),
      ),
    );
  }
}
