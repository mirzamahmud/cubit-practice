import 'package:api_service_interceptor/api_service_interceptor.dart';
import 'package:cubit_practice/core/di/dependency_injection.dart';
import 'package:cubit_practice/cubit/home/home_cubit.dart';
import 'package:cubit_practice/cubit/splash/splash_cubit.dart';
import 'package:cubit_practice/data/repo/home/home_repo.dart';
import 'package:cubit_practice/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => HomeCubit(
          repo: HomeRepo(
            apiService: ApiServiceInterceptor(
              sharedPreferences: dependencyInject()
            )
          )
        ))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cubit Practice",
        home: SplashScreen(),
      )
    );
  }
}
