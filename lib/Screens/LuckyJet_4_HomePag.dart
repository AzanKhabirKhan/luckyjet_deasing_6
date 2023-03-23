import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import '../App_Constants/Constants.dart';
import '../App_Controller/model/questions_model.dart';
import 'LuckyJet4_Profile_Screen.dart';
import 'LuckyJet_6_Leaderboard_Screen.dart';
import 'live_quiz6.dart';

class live_quiz6 extends StatefulWidget {
  const live_quiz6({Key? key}) : super(key: key);

  @override
  State<live_quiz6> createState() => _live_quiz6State();
}

class _live_quiz6State extends State<live_quiz6> {
  Questions_model? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    //questions
    final String response =
        await rootBundle.loadString('images/questions.json');
    model = Questions_model.fromJson(json.decode(response));
    print(model?.questions![0].questions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BackGroundGradient,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 28),
          child: ListView(
            children: [
            Padding(
              padding:  EdgeInsets.only(top: 65.0,left: 30),
              child: Text("Welcome",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.white),),
            ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LuckyJet_4_Profile_Screen()));
                },
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 35,top: 30),
                      child: Image.asset(
                        "images/Ruby.png",
                      ),
                    ),
                     Padding(
                       padding:  EdgeInsets.only(left: 10.0,top: 25),
                       child: Text("user name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),),
                     )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: 70.0),
                      child: Column(
                        children: [
                          Text(
                            "12",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFFFFFF)),

                          ),
                          Text(
                            "Rank",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffC3CFF9)),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "350",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF)),
                        ),
                        Text(
                          "Total Points",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffC3CFF9)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffF9F4FF)),
                    padding: EdgeInsets.only(
                        top: 100, bottom: 35, left: 18, right: 26),
                    margin: EdgeInsets.only(top: 100, ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 30),
                          child: Text(
                            "Play Quiz select the right answer",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff5322BC)),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                            child: Elevated_Button("Play QUIZ", () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Page_Live_Quiz(model: model!),
                                  ));
                            }, 70, 15, 14))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    child: Image.asset("images/firman.png"),
                  ),
                  Positioned(
                    top: 110,
                    right: 20,
                    child: Image.asset("images/question.png"),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
