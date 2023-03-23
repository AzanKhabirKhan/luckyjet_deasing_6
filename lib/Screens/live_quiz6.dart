import 'package:flutter/material.dart';
import 'package:luckyjet_deasing_6/App_Constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../App_Controller/model/questions_model.dart';
import 'LuckyJet4_Congratulations.dart';



class Page_Live_Quiz extends StatefulWidget {
  final Questions_model model;
   Page_Live_Quiz({Key? key, required this.model}) : super(key: key);

  @override
  State<Page_Live_Quiz> createState() => _Page_Live_QuizState();
}

class _Page_Live_QuizState extends State<Page_Live_Quiz> {
  int index = 0;
  int Score = 0;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 42),
           decoration: BackGroundGradient,
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     customAppBar(context, 'Live Quiz'),
                     SizedBox(
                       height: 16,
                     ),
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
                       margin: EdgeInsets.only(top: 40),
                       padding:
                       EdgeInsets.symmetric(vertical: 33, horizontal: 50),
                       child: Column(
                         children: [
                           SizedBox(
                             height: 16,
                           ),
                           Text(
                             "Question  2/150",
                             style: TextStyle(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 12,
                                 color: Color(0xff040543)),
                           ),
                           Container(
                             decoration: BoxDecoration(
                               image: new DecorationImage(
                                 image: ExactAssetImage('images/Elements.png'),
                                 fit: BoxFit.fill,
                               ),
                             ),
                             padding: EdgeInsets.symmetric(vertical: 17),
                             // margin: EdgeInsets.only(
                             //     left: 22, right: 22, bottom: 62, top: 22),
                             // width: 300,
                             // height: 200,
                             child: Center(
                               child: Text(
                                 '${widget.model.questions?[index].questions}?',
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 18,
                                     color: Colors.black),
                               ),
                             ),
                           ),
                           Live_Quiz_OptionButton(
                             '${widget.model.questions?[index].incorrectAnswer?[0]}',
                             option1,
                                 () {
                               print("option 1");
                               if (option1) {
                                 print("true");
                                 option1 = false;
                               } else {
                                 print("false");
                                 option1 = true;
                                 option2 = false;
                                 option3 = false;
                                 option4 = false;
                               }
                               setState(() {});
                             },
                           ),
                           Live_Quiz_OptionButton(
                             '${widget.model.questions?[index].incorrectAnswer?[1]}',
                             option2,
                                 () {
                               if (option2) {
                                 option2 = false;
                               } else {
                                 option2 = true;
                                 option1 = false;
                                 option3 = false;
                                 option4 = false;
                               }
                               setState(() {});
                             },
                           ),
                           Live_Quiz_OptionButton(
                             '${widget.model.questions?[index].incorrectAnswer?[2]}',
                             option3,
                                 () {
                               if (option3) {
                                 option3 = false;
                               } else {
                                 option3 = true;
                                 option1 = false;
                                 option2 = false;
                                 option4 = false;
                               }
                               setState(() {});
                             },
                           ),
                           Live_Quiz_OptionButton(
                             '${widget.model.questions?[index].incorrectAnswer?[3]}',
                             option4,
                                 () {
                               if (option4) {
                                 option4 = false;
                               } else {
                                 option4 = true;
                                 option1 = false;
                                 option2 = false;
                                 option3 = false;
                               }
                               setState(() {});
                             },
                           ),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 80),
                       child: OutLine_Button("NEXT", () {
                         if (!option1 && !option2 && !option3 && !option4) {
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                               content: Text("Please Select an Option"
                                   "")));
                         } else {
                           if ((widget.model.questions?.length)! - 1 > index) {
                             // Score Update kaw
                             if (option1) {
                               if (widget.model.questions?[index]
                                   .incorrectAnswer?[0] ==
                                   widget.model.questions?[index].correctAnswer) {
                                 print("Correct Answer 1");
                                 Score++;
                               }
                             } else if (option2) {
                               if (widget.model.questions?[index]
                                   .incorrectAnswer?[1] ==
                                   widget.model.questions?[index].correctAnswer) {
                                 print("Correct Answer 2");
                                 Score++;
                               }
                             } else if (option3) {
                               if (widget.model.questions?[index]
                                   .incorrectAnswer?[2] ==
                                   widget.model.questions?[index].correctAnswer) {
                                 print("Correct Answer 3");
                                 Score++;
                               }
                             } else if (option4) {
                               if (widget.model.questions?[index]
                                   .incorrectAnswer?[3] ==
                                   widget.model.questions?[index].correctAnswer) {
                                 print("Correct Answer 4");
                                 Score++;
                               }
                             }
                             index++;
                             option1 = false;
                             option2 = false;
                             option3 = false;
                             option4 = false;
                             // _scrollController.scrollTo(
                             //     index: index, duration: Duration(seconds: 1));
                             setState(() {});
                           } else {
                             //result page
                             print(Score);
                             setScore();
                           }
                         }
                       }, 100, 15, 14),
                     )
                     // SizedBox(
                     //   height: 30,
                     // ),

                     // Row(
                     //   mainAxisAlignment: MainAxisAlignment.end,
                     //   children: [
                     //     Elevated_Button('Next', () {
                     //       if (!option1 && !option2 && !option3 && !option4) {
                     //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     //             content: Text("Please Select an Option"
                     //                 "")));
                     //       } else {
                     //         if ((widget.model.questions?.length)! - 1 > index) {
                     //           // Score Update kaw
                     //           if (option1) {
                     //             if (widget.model.questions?[index]
                     //                     .incorrectAnswer?[0] ==
                     //                 widget.model.questions?[index].correctAnswer) {
                     //               print("Correct Answer 1");
                     //               Score++;
                     //             }
                     //           } else if (option2) {
                     //             if (widget.model.questions?[index]
                     //                     .incorrectAnswer?[1] ==
                     //                 widget.model.questions?[index].correctAnswer) {
                     //               print("Correct Answer 2");
                     //               Score++;
                     //             }
                     //           } else if (option3) {
                     //             if (widget.model.questions?[index]
                     //                     .incorrectAnswer?[2] ==
                     //                 widget.model.questions?[index].correctAnswer) {
                     //               print("Correct Answer 3");
                     //               Score++;
                     //             }
                     //           } else if (option4) {
                     //             if (widget.model.questions?[index]
                     //                     .incorrectAnswer?[3] ==
                     //                 widget.model.questions?[index].correctAnswer) {
                     //               print("Correct Answer 4");
                     //               Score++;
                     //             }
                     //           }
                     //           index++;
                     //           option1 = false;
                     //           option2 = false;
                     //           option3 = false;
                     //           option4 = false;
                     //           // _scrollController.scrollTo(
                     //           //     index: index, duration: Duration(seconds: 1));
                     //           setState(() {});
                     //         } else {
                     //           //result page
                     //           print(Score);
                     //           setScore();
                     //         }
                     //       }
                     //       // Navigator.push(
                     //       //     context,
                     //       //     MaterialPageRoute(
                     //       //       builder: (context) => Congratulation_Page(
                     //       //           Score: Score, model: widget.model),
                     //       //     ));
                     //     }, 62, 12, 16),
                     //     // Image.asset('images/pngegg.png'),
                     //   ],
                     // ),
                   ],
                 ),
               ],
             ),
           ),
        ),
      ),
    );
  }

  setScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', Score).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LuckyJet4_Congratulations(
              Score: Score,
              model: widget.model,
            ),
          ));
    });
  }
}