import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../widgets/button_utils.dart';
import '../widgets/text_from_field.dart';
import '../widgets/text_utils.dart';

class OldPatient extends StatelessWidget {
  OldPatient({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
              text: 'Enter Patient Name',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.all(45),
                child: TextFromField(
                  controller: _nameController,
                  validator: (value) =>
                      value!.isEmpty ? 'enter a valid Name' : null,
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Patient Name',
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Button(
              text: 'Auth',
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  var user = FirebaseFirestore.instance;

                  if (user != null) {
                    var uid = Get.arguments;
                    // streamSnapshot.data.docs[index].id.toString();
                    // await user
                    //     .collection('users')
                    //     .doc(uid)
                    //     .update({
                    //       'fees': _procedureController.text,
                    //       'procedure_name': _procedureNameController.text,
                    //     })
                    //     .then((value) => print("User Added"))
                    //     .catchError(
                    //         (error) => print("Failed to add user: $error"));

                    // if (uid == '3EGsAhudQGmnOhn5edB5') {
                      Get.toNamed(
                        Routes.newAppointment,
                        arguments: uid = '3EGsAhudQGmnOhn5edB5',
                      );
                    // }
                  }
                }

                ;
              },
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
