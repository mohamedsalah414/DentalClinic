import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../widgets/button_utils.dart';
import '../widgets/text_utils.dart';

class ProcedureBill extends StatelessWidget {
  const ProcedureBill({Key? key}) : super(key: key);

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
                    text: 'New Receipt',
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
                    text: 'Procedure Name : ${data['procedure_name']}',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  Button(
                    text: 'Goto Home',
                    onPressed: () {
                      Get.offAllNamed(Routes.homeScreen,);

                    },
                    color: Colors.green,
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