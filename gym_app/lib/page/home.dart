// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Auth/First_page.dart';
import 'package:gym_app/page/addCourse.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
      children: [
          InkWell(
            onTap: () {
              _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => First_page()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon( Icons.logout, size: 20,),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60 / 2),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://thumbs.dreamstime.com/b/handsome-man-black-suit-white-shirt-posing-studio-attractive-guy-fashion-hairstyle-confident-man-short-beard-125019349.jpg'),
                          fit: BoxFit.cover)),
                ),
                Text(
                  "${user!.email}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.local_fire_department,
                    color: Colors.white,
                    size: 34,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Stats",
                    style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                  ),
                ),
                Text(
                  "Muscles",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Front",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60 / 2),
                image: DecorationImage(
                  image: AssetImage('assets/img/front.png'),
                  // fit: BoxFit.cover
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0, left: 50.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addCoures()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[400],
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60 / 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Next",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
      ],
    ),
        ));
  }
}
