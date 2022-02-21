import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../widgets/button_utils.dart';
import '../widgets/text_from_field.dart';
import '../widgets/text_utils.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({Key? key}) : super(key: key);

  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _visittypeController = TextEditingController();
  final TextEditingController _feesController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();

    _timeController.dispose();

    _visittypeController.dispose();
    _feesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextUtils(
                text: 'Create New Appointment',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFromField(
                        controller: _dateController,
                        validator: (value) =>
                            value!.isEmpty ? 'enter a valid Date' : null,
                        prefixIcon: const Icon(Icons.date_range),
                        hintText: 'Date',
                        keyboardType: TextInputType.datetime,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFromField(
                        controller: _timeController,
                        validator: (value) =>
                            value!.isEmpty ? 'enter a valid Time' : null,
                        prefixIcon: const Icon(Icons.timer),
                        hintText: 'Time',
                        keyboardType: TextInputType.datetime,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFromField(
                        controller: _visittypeController,
                        validator: (value) =>
                            value!.isEmpty ? 'enter a valid Visit Type' : null,
                        prefixIcon: const Icon(Icons.medical_services),
                        hintText: 'Visit Type',
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFromField(
                        controller: _feesController,
                        validator: (value) =>
                            value!.isEmpty ? 'enter a valid Fees' : null,
                        prefixIcon: const Icon(Icons.monetization_on_outlined),
                        hintText: 'Fees',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Button(
                        text: 'Create',
                        onPressed: () async {
                          var user = FirebaseFirestore.instance;
                          if (_formkey.currentState!.validate()) {
                            if (user != null) {
                              var uid = Get.arguments;
                              // streamSnapshot.data.docs[index].id.toString();
                              await user
                                  .collection('users')
                                  .doc(uid)
                                  .update({
                                    'date': _dateController.text,
                                    'time':
                                        _timeController.text,
                                    'Visit Type':
                                        _visittypeController.text,
                                    'fees': _feesController.text,

                                  })
                                  .then((value) => print("User Added"))
                                  .catchError((error) =>
                                      print("Failed to add user: $error"));
                              Get.toNamed(
                                Routes.billShow,
                                arguments: uid='3EGsAhudQGmnOhn5edB5',
                              );
                            }
                          }
                          ;
                        },
                        color: Colors.green,
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
