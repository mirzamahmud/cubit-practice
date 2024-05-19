import 'package:cubit_practice/data/model/home/user_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  const HomeState();
}

/// ------------------- initial state
class HomeInitialState extends HomeState{
  @override
  List<Object?> get props => [];
}

/// ------------------- loading state
class HomeLoadingState extends HomeState{
  @override
  List<Object?> get props => [];
}

/// ------------------- data loaded state
class HomeDataLoadedState extends HomeState{
  final List<UserResponseModel> userList;
  const HomeDataLoadedState({required this.userList});
  @override
  List<Object?> get props => [userList];
}

/// ------------------ error state
class HomeErrorState extends HomeState{
  final String errorMsg;
  const HomeErrorState({required this.errorMsg});

  @override
  List<Object?> get props => throw UnimplementedError();
}