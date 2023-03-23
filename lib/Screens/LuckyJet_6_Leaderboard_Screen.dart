import 'package:flutter/material.dart';
import '../App_Constants/Constants.dart';

class LuckyJet_6_Leaderboard_Screen extends StatefulWidget {
  const LuckyJet_6_Leaderboard_Screen({Key? key}) : super(key: key);

  @override
  State<LuckyJet_6_Leaderboard_Screen> createState() =>
      _LuckyJet_6_Leaderboard_ScreenState();
}

class _LuckyJet_6_Leaderboard_ScreenState
    extends State<LuckyJet_6_Leaderboard_Screen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        decoration: BackGroundGradient,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customAppBar(context, 'Leaderboard'),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xffFFFFFF),
                        Color(0xffFFFFFF),
                      ],
                    )),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    Image.asset("images/star_img.png"),
                    Leaderboard_Card(
                        "Ruby", "Name", "12,318", Color(0xffFFCC5B)),
                    Leaderboard_Card(
                        "Ruby", "Name", "11,280", Color(0xffE86F3E)),
                    Leaderboard_Card(
                        "Ruby", "Name", "10,850", Color(0xffDCDADA)),
                    Leaderboard_Card(
                        "Ruby", "Name", "10,250", Color(0xffDCDADA)),
                    Leaderboard_Card(
                        "Ruby", "Name", "8,064", Color(0xffDCDADA)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
