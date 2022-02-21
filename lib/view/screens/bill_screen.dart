import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentalclinic/view/widgets/button_utils.dart';
import 'package:dentalclinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../widgets/text_from_field.dart';

class BillShow extends StatefulWidget {
  const BillShow({Key? key}) : super(key: key);

  @override
  _BillShowState createState() => _BillShowState();
}

class _BillShowState extends State<BillShow> {
  final TextEditingController _procedureController = TextEditingController();
  final TextEditingController _procedureNameController = TextEditingController();

  @override
  void dispose() {
    _procedureController.dispose();
    _procedureNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference order = FirebaseFirestore.instance.collection('users');
    var uid = Get.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<DocumentSnapshot>(
        future: order.doc(uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                    text: 'Receipt',
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextUtils(
                    text: 'fees : ${data['fees']} LE',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextUtils(
                    text: 'date : ${data['date']}',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextUtils(
                    text: 'time : ${data['time']}',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.all(45),
                    child: TextFromField(
                      controller: _procedureController,
                      validator: (value) {},
                      prefixIcon: const Icon(Icons.monetization_on),
                      hintText: 'procedure',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(45),
                    child: TextFromField(
                      controller: _procedureNameController,
                      validator: (value) {},
                      prefixIcon: const Icon(Icons.medical_services),
                      hintText: 'procedure name',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Button(
                    text: 'Add Procedure',
                    onPressed: () async {
                      var user = FirebaseFirestore.instance;
                      if (user != null) {
                        var uid = Get.arguments;
                        // streamSnapshot.data.docs[index].id.toString();
                        await user
                            .collection('users')
                            .doc(uid)
                            .update({
                              'fees': _procedureController.text,
                              'procedure_name': _procedureNameController.text,

                            })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        Get.toNamed(
                          Routes.procedureBill,
                          arguments: uid = '3EGsAhudQGmnOhn5edB5',
                        );
                      }

                      ;
                    },
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Button(
                    text: 'Goto Home',
                    onPressed: () {
                      Get.offAllNamed(Routes.homeScreen,);

                    },
                    color: Colors.redAccent,
                  )
                ],
              ),
            );
          }

          return Text("loading");
        },
      ),
    );
  }
}
