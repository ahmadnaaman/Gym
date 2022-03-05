import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Auth/First_page.dart';
import 'package:gym_app/page/home.dart';
import 'package:gym_app/page/show_Train.dart';

class AuthHeader extends StatefulWidget {
  const AuthHeader({ Key? key }) : super(key: key);

  @override
  State<AuthHeader> createState() => _AuthHeaderState();
}

class _AuthHeaderState extends State<AuthHeader> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return MaterialApp(
      home: user == null? First_page(): Home_page(),
      // home:ShowTrain()
      
    );
  }
}