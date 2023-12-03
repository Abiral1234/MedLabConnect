import 'package:flutter/material.dart';
import '../../Model/lab_test_model.dart';
import 'Component/doctor_record_box.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key,required this.title});
  final String title;
  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: screenWidth,
        color: Colors.grey.shade100,
        child: model.isEmpty
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/no_record.png',
                  fit: BoxFit.cover,)),
                const SizedBox(height: 10,),
                const Text("No Record Found"),
              ],
            )
            : ListView.builder(
              shrinkWrap: true,
                itemCount: model.length,
                itemBuilder: (context, index) {
                  return DoctorRecord(
                    index:index+1,
                    patientName: model[index].patientName,
                    patientAge: model[index].patientAge,
                    patientAddress: model[index].patientAddress,
                    laboratoryTest: model[index].laboratoryTest,
                    labOrderDate: model[index].labOrderDate,
                    testResult:model[index].testResult,
                    rangeReference: model[index].referenceRange
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
              context,
              '/patientForm',
              arguments: callback,
            );
        },
        tooltip: 'add',
        child: const Icon(Icons.add),
      ),
    );
  }
  List<LabTestModel> model = [];
  callback(LabTestModel data) {
    setState(() {
      model.add(data);
    });
  }
}
