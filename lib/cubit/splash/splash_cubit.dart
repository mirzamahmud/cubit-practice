import 'dart:async';
import 'package:cubit_practice/cubit/splash/splash_state.dart';
import 'package:cubit_practice/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit() : super(SplashInitialState());

  gotoNextScreen(BuildContext context){
    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
}