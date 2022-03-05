// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gym_app/page/workOut.dart';

class addCoures extends StatefulWidget {
  const addCoures({Key? key}) : super(key: key);

  @override
  State<addCoures> createState() => _addCouresState();
}

class _addCouresState extends State<addCoures> with SingleTickerProviderStateMixin {
   TabController? _tabController;
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(vsync: this, length: 6);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: menu(),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon( Icons.arrow_back_ios, size: 20,),
                  Text(
                    'Back',
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
                "Hello Ahmad",
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
     SizedBox(height: 50,),
      SizedBox(
          height: 400,
 child: TabBarView(
          controller: _tabController,
          children: [
          show_image("assets/img/Quads.png", "Quads"),
          show_image("assets/img/shin.png", "Shin"),
          show_image("assets/img/chest.png", "Chest"),
          show_image("assets/img/deltoids.png", "Deltoids"),
          show_image("assets/img/abs.png", "Abs"),
          show_image("assets/img/Biceps.png", "Biceps"),
          
          
      ],),
      ),

      
    ]),
        )
    );
  }

  InkWell show_image( String image_show,String name) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WorkOut(
          image_show: image_show,
          name : name,
            )));
      },
      child: Container(
        // width: double.infinity,
        // height: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60 / 2),
            image: DecorationImage(
              image: AssetImage(image_show),
              // fit: BoxFit.cover
            )),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        isScrollable:true ,
        controller: _tabController,
        tabs: [
          Tab(
            text: "Quads",
            // icon: Icon(Icons.euro_symbol),
          ),
          Tab(
            text: "shin",
            // icon: Icon(Icons.account_balance_wallet),
          ),
          Tab(
            text: "chest",
            // icon: Icon(Icons.settings),
          ),
          Tab(
            text: "deltoids",
            // icon: Icon(Icons.settings),
          ),
          Tab(
            text: "ABS",
            // icon: Icon(Icons.settings),
          ),
          Tab(
            text: "Biceps",
            // icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
