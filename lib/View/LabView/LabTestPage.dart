import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/bloc/lab_test_bloc/lab_test_data_bloc.dart';
import '../../Model/LabRequisitionForm.dart';
import '../../Model/LabTestModel.dart';

class LabTestPage extends StatefulWidget {
  LabRequisitionFormModel patientDataModel;
  Function callback;
  LabTestPage(
      {super.key, required this.patientDataModel, required this.callback});

  @override
  State<LabTestPage> createState() => _LabTestPageState();
}

class _LabTestPageState extends State<LabTestPage> {
  bool loading = false;
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController testresult = TextEditingController();
  final TextEditingController referenceRange = TextEditingController();
  void _moveToNextField(FocusNode currentFocusNode, FocusNode nextFocusNode) {
    currentFocusNode.unfocus(); // Remove focus from the current field
    FocusScope.of(context)
        .requestFocus(nextFocusNode); // Move focus to the next field
  }

  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    //LabDataBloc labDataBloc = BlocProvider.of<LabDataBloc>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double physicalScreenWidth =
        screenWidth * MediaQuery.of(context).devicePixelRatio;
    return BlocListener<LabTestDataBloc, LabTestDataState>(
      listener: (context, state) {
        if (state is LabTestDataWasSubmitted) {
          widget.callback(state.labTestModel);
          FocusScope.of(context).unfocus();
          Navigator.of(context).pop();
          FocusScope.of(context).unfocus();
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: BackButton(
            color: Colors.white,
          ),
          title: Text(
            "Lab Test",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          color: Colors.grey.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 180,
                      width: physicalScreenWidth,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Patient’s name : ' +
                                  widget.patientDataModel.patientName),
                              SizedBox(height: 5),
                              Text('Patient’s age : ' +
                                  widget.patientDataModel.patientAge
                                      .toString() +
                                  ' years'),
                              SizedBox(height: 5),
                              Text('Patient’s address : ' +
                                  widget.patientDataModel.patientAddress),
                              SizedBox(height: 5),
                              Text('Laboratory test : ' +
                                  widget.patientDataModel.laboratoryTest),
                              SizedBox(height: 5),
                              Text('Lab order date : ' +
                                  widget.patientDataModel.labOrderDate.year.toString()
                                  +'-'+
                                  widget.patientDataModel.labOrderDate.month.toString()
                                  +'-'+
                                  widget.patientDataModel.labOrderDate.day.toString()

                                      .toString()
                                  ),
                            ]),
                      ),
                    ),
                    TextFormField(
                      focusNode: _focusNode1,
                      controller: testresult,
                      decoration: InputDecoration(labelText: 'Test result:'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter test result';
                        }
                        return null;
                      },
                      onFieldSubmitted: (val) {
                        _moveToNextField(_focusNode1, _focusNode2);
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      focusNode: _focusNode2,
                      controller: referenceRange,
                      decoration:
                          InputDecoration(labelText: 'Reference range:'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter reference range';
                        }
                        return null;
                      },
                      onFieldSubmitted: (val) {
                        _focusNode2.unfocus();
                        //  _moveToNextField(_focusNode3, _focusNode4);
                      },
                    ),
                    SizedBox(height: 25.0),
                    Container(
                      width: physicalScreenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            BlocProvider.of<LabTestDataBloc>(context).add(
                                LabTestDataSubmitted(
                                    widget.patientDataModel.patientName,
                                    int.parse(widget.patientDataModel.patientAge
                                        .toString()),
                                    widget.patientDataModel.patientAddress,
                                    widget.patientDataModel.laboratoryTest,
                                    widget.patientDataModel.labOrderDate,
                                    testresult.text,
                                    referenceRange.text,
                                    widget.callback));
                          }
                        },
                        child:  BlocBuilder<LabTestDataBloc, LabTestDataState>(
                                builder: (context, state) {
                                  if(state is SubmittingLabTestData){
                                  return Container(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator());
                                  }
                                  else{
                                    return Text('Submit');
                                  }
                                },
                              )
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
