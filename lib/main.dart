import 'package:flutter/material.dart';
import 'package:luckyjet_deasing_6/Screens/LuckyJet_4_HomePag.dart';
import 'App_Constants/Constants.dart';
import 'App_Controller/DioClient/DioClient.dart';
import 'App_Controller/Services/ServerPageeService.dart';
import 'App_Controller/cubit_and_bloc/Authentication_cubit/ServerCubit.dart';
import 'Screens/LuckyJet_6_Splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServerCubit>(
          create: (context) => ServerCubit(
            apiRepository: ServerPageeService(
              apiService: DioClient(Globals.BaseURL),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => LuckyJet_6_Splash(),
        },
      ),
    );
  }
}
