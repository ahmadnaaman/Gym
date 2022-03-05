// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ShowTrain extends StatefulWidget {
  const ShowTrain({ Key? key }) : super(key: key);

  @override
  State<ShowTrain> createState() => _ShowTrainState();
}

class _ShowTrainState extends State<ShowTrain> {
    PageController? pageViewController = PageController(
      initialPage: 0,
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Show Train',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:Column(
        children: [
          Center(
         child:   Text('Train',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity, height: 300,
            child: PageView(
                            controller: pageViewController ,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                               
                                decoration: BoxDecoration( 
                                     borderRadius: BorderRadius.circular(15),
                                     image: DecorationImage(
                                       image: NetworkImage('https://cdn.mos.cms.futurecdn.net/TrYJxk7Jk7Eebe3aNuDBNV.jpg'),
                                       fit: BoxFit.cover,
                                     ),
                                 ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15),
                                     image: DecorationImage(
                                       image: NetworkImage('https://www.bodybuilding.com/images/2016/july/8-techniques-to-build-monster-quads-v2-2-700xh.jpg'),
                                       fit: BoxFit.cover,
                                     ),
                                 ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration( 
                                     borderRadius: BorderRadius.circular(15),
                                     image: DecorationImage(
                                       image: NetworkImage('https://www.mensjournal.com/wp-content/uploads/2021/09/backsquat.jpg?w=900&quality=86&strip=all'),
                                       fit: BoxFit.cover,
                                     ),
                                 ),
                              ),
                              
                          
                            ],
                          ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
            style: TextStyle(fontSize: 15,color: Colors.grey[600]),),
          )
        ],
      ) ,
    );
  }
}