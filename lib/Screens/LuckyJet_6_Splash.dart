import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../App_Constants/Constants.dart';
import '../App_Controller/DioClient/DioClient.dart';
import '../App_Controller/Services/ServerPageeService.dart';
import '../App_Controller/cubit_and_bloc/Authentication_cubit/ServerCubit.dart';
import '../App_Controller/model/questions_model.dart';
import 'Screen_6.dart';
import 'LuckyJet_4_HomePag.dart';
import 'nev_bar.dart';

class LuckyJet_6_Splash extends StatefulWidget {
  @override
  State<LuckyJet_6_Splash> createState() => _LuckyJet_6_SplashState();
}

class _LuckyJet_6_SplashState extends State<LuckyJet_6_Splash> {
  @override
  Widget build(BuildContext context) {
    String lang = Localizations.localeOf(context).toString();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/back_ground.png"),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(),
              Image.asset(
                "images/logo.png",
                width: 162,
                height: 162,
              ),
              BlocProvider(
                create: (context) => ServerCubit(
                  apiRepository: ServerPageeService(
                    apiService: DioClient(Globals.BaseURL),
                  ),
                )..GetQuestion(lang),
                child: BlocConsumer<ServerCubit, ServerState>(
                  listener: (context, state) async {
                    if (state is ServerSuccess) {
                      questionlist data = questionlist
                          .fromJson(jsonDecode(state.response?.data));
                      if (data.data![0].coef == 20) {
                        print("${data.data![0].coef}");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Screen6(),
                            ));
                      } else if (data.data![0].coef == 19) {
                        print("${data.data![0].coef}");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LuckyJet_Bottm_Nav(),
                            ));
                      }
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      child: SizedBox(
                        height: 45,
                        width: 45,
                        child: CircularProgressIndicator(
                          strokeWidth: 6,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Color(0xff95F12B),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
