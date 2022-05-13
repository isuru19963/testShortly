import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_svg/svg.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<IntroPage> {
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SvgPicture.asset(
                    'assets/Images/logo.svg',
                  ),
                  SvgPicture.asset(
                    'assets/Images/illustration.svg',
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child:Container(
                        width:MediaQuery.of(context).size.width ,
                        height: 200,
                        child: PageView(
                          padEnds:false,
                          pageSnapping: true,

                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            setState(() {
                              // _current = index;
                            });
                          },
                          controller: PageController(
                              viewportFraction: scheduledList.length==1?1.0:0.9, initialPage: 1),
                          children:  imageSliders,
                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center, //
                    children: const [
                      Text(
                        "Build your brand's recognition and \n get detailed insight on how your \n links are performing",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'Poppins'),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff2ACFCF),
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 300.0,
                      height: 60.0,
                      child: const Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
