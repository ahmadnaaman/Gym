import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Auth/Register.dart';
import 'package:gym_app/AuthHeader.dart';
import 'package:gym_app/page/home.dart';
import 'package:gym_app/page/workOut.dart';

import 'Auth/First_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuthHeader());
}
