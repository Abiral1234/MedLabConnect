import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Controller/bloc/patient_form_bloc/patient_form_bloc.dart';

// ignore: must_be_immutable
class LabRequisitionForm extends StatefulWidget {
  Function callback;
  LabRequisitionForm({super.key, required this.callback});

  @override
  State<LabRequisitionForm> createState() => _LabRequisitionFormState();
}

class _LabRequisitionFormState extends State<LabRequisitionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController patientName = TextEditingController();
  final TextEditingController patientAge = TextEditingController();
  final TextEditingController patientAddress = TextEditingController();
  final TextEditingController laboratoryTest = TextEditingController();
  final TextEditingController labOrderDate = TextEditingController();
  DateTime currentDate = DateTime.now();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  bool loading = false;
  void _moveToNextField(FocusNode currentFocusNode, FocusNode nextFocusNode) {
    currentFocusNode.unfocus(); // Remove focus from the current field
    FocusScope.of(context)
        .requestFocus(nextFocusNode); // Move focus to the next field
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double physicalScreenWidth =
        screenWidth * MediaQuery.of(context).devicePixelRatio;

    return BlocListener<PatientFormBloc, PatientFormState>(
      listener: (context, state) {
        if (state is PatientFormSent) {
          Navigator.pushNamed(
            context,
            '/labTestPage',
            arguments: {
              'patientDataModel': state.model,
              'callback':widget.callback, // Replace with your actual callback
            },
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            "Lab Requisition Form",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  focusNode: _focusNode1,
                  controller: patientName,
                  decoration: const InputDecoration(labelText: 'Patient’s name:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient’s name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (val) {
                    _moveToNextField(_focusNode1, _focusNode2);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _focusNode2,
                  controller: patientAge,
                  decoration: const InputDecoration(labelText: 'Patient’s age:'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient’s age';
                    }
                    try {
                      int age = int.parse(value);
                      if (age <= 0) {
                        return 'Please enter a valid positive age.';
                      }
                    } catch (e) {
                      return 'Please enter a valid number for age.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (val) {
                    _moveToNextField(_focusNode2, _focusNode3);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _focusNode3,
                  controller: patientAddress,
                  decoration: const InputDecoration(labelText: 'Patient’s address:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient’s address';
                    }
                    return null;
                  },
                  onFieldSubmitted: (val) {
                    _moveToNextField(_focusNode3, _focusNode4);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _focusNode4,
                  controller: laboratoryTest,
                  decoration: const InputDecoration(labelText: 'Laboratory test:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter laboratory test';
                    }
                    return null;
                  },
                  onFieldSubmitted: (val) {
                    _focusNode4.unfocus();
                    //  _moveToNextField(_focusNode3, _focusNode4);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  readOnly: true,
                  initialValue:
                      "${currentDate.year}-${(currentDate.month)}-${currentDate.day}",
                  decoration: const InputDecoration(
                    labelText: "Lab order date:",
                  ),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: physicalScreenWidth,
                  child: ElevatedButton(onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<PatientFormBloc>(context).add(
                          PatientFormSubmitted(
                              patientName.text,
                              int.parse(patientAge.text.toString()),
                              patientAddress.text,
                              laboratoryTest.text,
                              currentDate,
                              widget.callback));
                    }
                  }, child: BlocBuilder<PatientFormBloc, PatientFormState>(
                    builder: (context, state) {
                      if (state is SendingPatientForm) {
                        return const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator());
                      } else {
                        return const Text('Submit');
                      }
                    },
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
