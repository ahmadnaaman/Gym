// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Auth/login.dart';
import 'package:gym_app/model/userModel.dart';
import 'package:gym_app/page/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("assets/img/register.jpeg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop))),
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFile(
                        "User name", false, Icons.person, _userNameController),
                    TextFile("Email ", false, Icons.alternate_email,
                        _emailController),
                    TextFile("Password", true, Icons.lock, _passwordController),
                    TextFile("Confirm Password", true, Icons.lock,
                        _confirmPasswordController),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                       add_user();
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_page()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 120, right: 120),
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(60 / 2),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                      SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              
              },
              child: Text(
                "Already have an account?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
                  ],
                ),
              ))),
    );
  }

  TextField TextFile(String text, bool obscureText, IconData icon,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(
          "$text",
          style: TextStyle(color: Colors.grey[400]),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: obscureText,
    );
  }

  add_user() async {

UserModel userModel = UserModel(
  username: _userNameController.text,
  email: _emailController.text,
  password: _passwordController.text,
);

  UserCredential register=  await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if(register!=null){
     await _firestore.collection("users").doc(register.user!.uid).set(userModel.toMap());
    }
  }
}
