import 'dart:convert';

import 'package:api_service_interceptor/api_service_interceptor.dart';
import 'package:cubit_practice/cubit/home/home_state.dart';
import 'package:cubit_practice/data/model/home/user_response_model.dart';
import 'package:cubit_practice/data/repo/home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeRepo repo;
  HomeCubit({required this.repo}) : super(HomeInitialState());

  /// ------------------ initialize variables
  List<UserResponseModel> userList = [];

  /// ------------------ this method is used to get user data
  Future<void> loadUserData() async{
    emit(HomeLoadingState());

    ApiResponseModel responseModel = await repo.getUserData();
    if(responseModel.statusCode == 200){
      List<dynamic> tempList = jsonDecode(responseModel.responseJson);
      if(tempList.isNotEmpty){
        userList = tempList.map((e) => UserResponseModel.fromJson(e)).toList();
        emit(HomeDataLoadedState(userList: userList));
      }
    }else{
      emit(const HomeErrorState(errorMsg: "Unsuccessful"));
    }
  }
}