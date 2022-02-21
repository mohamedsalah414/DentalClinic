import 'package:dentalclinic/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../widgets/button_utils.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextUtils(
            text: 'Welcome',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
          const SizedBox(
            height: 70,
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: 'New Patient',
                onPressed: () {
                  Get.toNamed(Routes.newPatient);

                },
                color: Colors.green,
              ),
              const SizedBox(
                width: 25,
              ),
              Button(
                text: 'Old Patient',
                color: Colors.deepOrangeAccent,
                onPressed: () {
                  Get.toNamed(Routes.oldPatient);
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
