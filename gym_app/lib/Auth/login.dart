// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Auth/Register.dart';
import 'package:gym_app/page/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 24, 29, 35),
        image: DecorationImage(
          image: AssetImage("assets/img/login.jpg"),
          fit: BoxFit.fill,
          // opacity: 0.8,
          colorFilter:
              ColorFilter.mode(Colors.red.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
            ),
            TextFile("Email", false, Icons.alternate_email, _emailController),
            TextFile("password", true, Icons.lock_outline, _passwordController),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                login_system();
               
              },
              child: Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 120, right: 120),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 105, 104, 104),
                  borderRadius: BorderRadius.circular(60 / 2),
                ),
                child: Text(
                  "Sign in",
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
              onPressed: () {},
              child: Text(
                "Forgot password?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Register();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Have an account? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                          color: Color.fromARGB(255, 22, 69, 181),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  TextField TextFile(String text, bool obscureText, IconData icon,TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(
          "$text",
          style: TextStyle(color: Colors.white),
        ),
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
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

  login_system() async {
   UserCredential user = await _auth.signInWithEmailAndPassword(
        email:_emailController.text , password: _passwordController.text);
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home_page()));
    }
  }


}
