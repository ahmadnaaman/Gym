// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gym_app/page/addCourse.dart';
import 'package:gym_app/page/home.dart';
import 'package:gym_app/page/show_Train.dart';

class WorkOut extends StatefulWidget {
  final String? name;
  final String? image_show;
  const WorkOut({
    Key? key,
    this.name,
    this.image_show,
  }) : super(key: key);

  @override
  State<WorkOut> createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Workout',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Text(
                '${widget.name}',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    width: 50,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image_show!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Tired",
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Last Exercises",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Butt & Legs",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            show_cours(),
            show_cours(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Recommended Exercises",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            show_cours_optinal(),
            show_cours_optinal(),
          ],
        ));
  }

  Row show_cours() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowTrain()));
          
          }, 
          child: Container(
            width: 50,
            height: 60,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  'https://cdn.mos.cms.futurecdn.net/TrYJxk7Jk7Eebe3aNuDBNV.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Chest Dip",
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
            ),
            Text(
              "15 times",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Container(
          width: 50,
          height: 60,
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "AUG",
                  style: TextStyle(fontSize: 12, color: Colors.grey[200]),
                ),
              ),
              Text(
                "17",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row show_cours_optinal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 50,
          height: 60,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/topic_centers/man-deadlift-1296x728-header.jpg?w=1155&h=1528',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Svend Press",
                style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "15 times",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Container(
          width: 50,
          height: 60,
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
