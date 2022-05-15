import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_svg/svg.dart';

import 'intro_screen.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        toolbarHeight: 0,
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SvgPicture.asset(
                              'assets/Images/logo.svg',
                            ),
                            SvgPicture.asset(
                              'assets/Images/illustration.svg',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //
                              children: const [
                                Text(
                                  "Let's get started",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontFamily: 'Poppins'),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //
                              children: const [
                                Text(
                                  "Paste your first link into \n the field to shorten it",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily: 'Poppins'),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),


                          ],
                        ),




              Row(
                children: [
                  Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            child: Image.asset( 'assets/Images/shape-svg.png'),
                          )
                      ),
                  Container(
                    width: size.width,

                    decoration: BoxDecoration(
                      color: Color(0xff3B3054),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,

                                hintStyle: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w700,fontSize: 22,),
                                hintText: "Shorten a link here ...",
                                fillColor: Colors.white70),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Material(
                            elevation: 0,

                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff2ACFCF),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        const OnboardingScreen(),
                                  ),
                                );
                              },
                              height: 60.0,
                              minWidth: size.width*0.9,
                              child: const Text(
                                "SHORTEN IT!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                      // Align(
                      //     alignment: Alignment.topRight,
                      //     child: Image.asset( 'assets/Images/shape-svg.png'),
                      //
                      // ),

        ]
      ),

                ],
              )
            ],
          )),
    );
  }
}
