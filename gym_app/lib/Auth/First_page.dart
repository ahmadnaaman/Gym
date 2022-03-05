// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gym_app/Auth/login.dart';

class First_page extends StatefulWidget {
  const First_page({ Key? key }) : super(key: key);

  @override
  State<First_page> createState() => _First_pageState();
}

class _First_pageState extends State<First_page> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
    body: Stack(
      children: <Widget>[
         Container(
           height: double.infinity,
            width: double.infinity,
          decoration:  BoxDecoration(
            image:  DecorationImage(image:  AssetImage("assets/img/background.jpg"),
            fit: BoxFit.fill),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:InkWell(
            onTap: (){
              // Navigator.pushNamed(context, '/second_page');
            },
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Container(
                padding: EdgeInsets.all(15),
                width: 200,
                decoration:  BoxDecoration(
                  borderRadius:  BorderRadius.circular(20),
                  border: Border.all(color: Color.fromARGB(255, 50, 221, 230),width: 2),
                
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Started',style: TextStyle(color: Colors.white,fontSize: 24),),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 30,)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    )
  );
  }
}