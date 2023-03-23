import 'package:flutter/material.dart';
import '../App_Constants/Constants.dart';
import 'LuckyJet4_Profile_Screen.dart';
import 'LuckyJet_4_HomePag.dart';
import 'LuckyJet_6_Leaderboard_Screen.dart';

class LuckyJet_Bottm_Nav extends StatefulWidget {
  const LuckyJet_Bottm_Nav({Key? key}) : super(key: key);

  @override
  State<LuckyJet_Bottm_Nav> createState() => _LuckyJet_Bottm_NavState();
}

class _LuckyJet_Bottm_NavState extends State<LuckyJet_Bottm_Nav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    live_quiz6(),
    LuckyJet_6_Leaderboard_Screen(),
    LuckyJet_4_Profile_Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2E174E),
      body: SafeArea(
        child: Container(
          decoration: BackGroundGradient,
          child: _widgetOptions[_selectedIndex],
        ),
      ),
      bottomNavigationBar: Container(
        // Bottom Navigation Bar main container
        margin: EdgeInsets.only(bottom: 30, left: 10, right: 10, top: 12),
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // color: Color(0xff00100C),
          color: Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                width: 105,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff643A9D),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Wrap(
                  // alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset("images/home_act.png"),
                    SizedBox(width: 7),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFB3BF)),
                    )
                  ],
                ),
              ),
              icon: ImageIcon(
                AssetImage("images/home_uact.png"),
                // color: Color(0xffB3B79B),
                size: 40,
              ),
              // ImageIcon(AssetImage("images/BNHome.png")),
              label: '',
              // backgroundColor: Color(0xFFF1F3FF),
            ),
            BottomNavigationBarItem(
                activeIcon: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff643A9D),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("images/cup_img.png"),
                        color: Color(0xffFFB3BF),
                        size: 40,
                      ),
                      // SizedBox(width: 2),
                      Text(
                        'Leaderboard',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFB3BF)),
                      ),
                    ],
                  ),
                ),
                icon: Image.asset("images/cup_unact.png"),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Container(
                  alignment: Alignment.center,
                  width: 115,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff643A9D),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset(
                        "images/prof_unact.png",
                        color: Color(0xffFFB3BF),
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFB3BF)),
                      ),
                    ],
                  ),
                ),
                icon: ImageIcon(
                  AssetImage("images/prof_act.png"),
                  size: 40,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}