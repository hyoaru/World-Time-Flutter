import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/res/TextStyles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:worldtime/pages/DrawerHeader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  // final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: ColorsUsed.primary,
        backgroundColor: Colors.white,
        // brightness: Brightness.dark,
        elevation: 0,
        title: Text(
          'Date here',
        ),
        titleSpacing: MediaQuery.of(context).size.width / 9,
        actions: [
          Builder(builder: (context) {
            return IconButton(
                icon: Icon(
                  CupertinoIcons.location,
                  size: 25,
                  color: ColorsUsed.primary,
                ),
                onPressed: () {
                  setState(() {
                    Scaffold.of(context).openDrawer();
                  });
                });
          }),
          SizedBox(
            width: MediaQuery.of(context).size.width / 13,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHeaders(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // alignment: Alignment.topCenter,
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEDNESDAY'.toUpperCase(),
                        style: S1TextStyle,
                      ),
                      Container(
                        // color: Colors.lightBlueAccent,
                        margin: EdgeInsets.only(top: 3),
                        child: Text(
                          '12:00 AM',
                          style: MainTextStyle,
                        ),
                      ),
                      Text(
                        '00:00',
                        style: S2TextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 5,
              // aspectRatio: 5.0,
              viewportFraction: 0.6,
              enlargeCenterPage: true,
            ),
            items: [
              1,
              2,
              3,
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: ColorsUsed.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 7,
                            child: Container(
                              // color: Colors.amber,
                              // // alignment: Alignment.center,
                              child: Text(
                                'textasdasdsadasdadasdasdasdadfsdfsdfsdfsdfsd',
                                style: CarouselTextStyle,
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              // width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Text(
                                '500',
                                style: CarouselTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}