import 'package:dentalclinic/view/screens/bill_screen.dart';
import 'package:dentalclinic/view/screens/home_screen.dart';
import 'package:dentalclinic/view/screens/new_appointment.dart';
import 'package:dentalclinic/view/screens/new_patient.dart';
import 'package:dentalclinic/view/screens/old_patient.dart';
import 'package:dentalclinic/view/screens/procedure_bill_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
//initialRoute
  static const home = Routes.homeScreen;
//getPages

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const Home_Screen(),
    ),
    GetPage(
      name: Routes.newPatient,
      page: () =>  NewPatient(),
    ),
    GetPage(
      name: Routes.newAppointment,
      page: () => NewAppointment(),
    ),
    GetPage(
      name: Routes.billShow,
      page: () => BillShow(),
    ),
    GetPage(
      name: Routes.procedureBill,
      page: () => ProcedureBill(),
    ),
    GetPage(
      name: Routes.oldPatient,
      page: () => OldPatient(),
    ),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
  static const newPatient = '/newPatient';
  static const newAppointment = '/newAppointment';
  static const billShow = '/billShow';
  static const procedureBill = '/procedureBill';
  static const oldPatient = '/oldPatient';
}