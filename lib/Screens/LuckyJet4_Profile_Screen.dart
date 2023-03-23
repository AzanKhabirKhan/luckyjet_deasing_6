import 'package:flutter/material.dart';
import '../App_Constants/Constants.dart';

class LuckyJet_4_Profile_Screen extends StatefulWidget {
  const LuckyJet_4_Profile_Screen({Key? key}) : super(key: key);

  @override
  State<LuckyJet_4_Profile_Screen> createState() =>
      _LuckyJet_4_Profile_ScreenState();
}

class _LuckyJet_4_Profile_ScreenState extends State<LuckyJet_4_Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackGroundGradient,
        padding: EdgeInsets.symmetric(vertical: 22),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(""),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/profile_pic.png",
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
