import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable{
  const SplashState();
}

class SplashInitialState extends SplashState{
  @override
  List<Object?> get props => [];
}