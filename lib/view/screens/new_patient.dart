import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentalclinic/view/widgets/button_utils.dart';
import 'package:dentalclinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../widgets/text_from_field.dart';

class NewPatient extends StatefulWidget {
  const NewPatient({Key? key}) : super(key: key);

  @override
  _NewPatientState createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _AgeController = TextEditingController();
  final TextEditingController _AddressController = TextEditingController();
  final TextEditingController _PhoneNoController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();

    _AgeController.dispose();

    _AddressController.dispose();

    _PhoneNoController.dispose();

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
                text: 'Create New Patient Account',
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
                        controller: _nameController,
                        validator: (value) =>
                            value!.isEmpty ? 'enter a valid Name' : null,
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Name',
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFromField(
                        controller: _AgeController,
                        validator: (value) =>
                            value!.isEmpty ? 'enter a valid Age' : null,
                        prefixIcon: const Icon(Icons.date_range),
                        hintText: 'Age',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFromField(
                        controller: _AddressController,
                        validator: (value) =>
                            value!.isEmpty ? 'enter a valid Address' : null,
                        prefixIcon: const Icon(Icons.place_outlined),
                        hintText: 'Address',
                        keyboardType: TextInputType.streetAddress,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFromField(
                        controller: _PhoneNoController,
                        validator: (value) =>
                            value.isEmpty ? 'enter a valid Phone NO.' : null,
                        prefixIcon: const Icon(Icons.phone),
                        hintText: 'Phone',
                        keyboardType: TextInputType.phone,
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
                              await user
                                  .collection('users')
                                  .add({
                                    'full_name':
                                        _nameController.text, // John Doe
                                    'Address': _AddressController
                                        .text, // Stokes and Sons
                                    'age': _AgeController.text, // 42
                                    'Phone': _PhoneNoController.text, // 0123545
                                    // 'id': uid,
                                    'date': "",
                                    'time': "",
                                    'Visit Type': "",
                                    'fees': "",
                                    'procedure_name':"",

                                  })
                                  .then((value) => print("User Added"))
                                  .catchError((error) =>
                                      print("Failed to add user: $error"));
                              var uid =  users.doc().id;
                              // print('1 Uid is ${uid}');

                              Get.toNamed(
                                Routes.newAppointment,
                                arguments: uid='3EGsAhudQGmnOhn5edB5',
                              //  i have a problem here that i cant get the current document id
                              //  so i pass id manually
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
