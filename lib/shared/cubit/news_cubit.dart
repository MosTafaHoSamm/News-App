
import 'package:appnews2/module/business_screen.dart';
import 'package:appnews2/module/science_screen.dart';
import 'package:appnews2/module/sport_screen.dart';
 import 'package:appnews2/shared/network/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/dio_helper.dart';
import 'news_states.dart';

class NewsCubit extends Cubit <NewsState>{
  NewsCubit():super(IntialState());

  static NewsCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;

  List<BottomNavigationBarItem>items=[

    BottomNavigationBarItem(icon: Icon(Icons.sports_sharp),label: 'Sport'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.business_center),label: 'Business'),

  ];
  void changeIndex(index)
  {
    currentIndex=index;
    emit(ChangeBottomNavState());

  }
  List<Widget>screens=[
    SportScreen(),
    ScienceScreen(),
    BusinessScreen(),
  ];
  List   sports=[];
  List science=[];
  List business=[];

  void getSports()
  {
    emit(GetSportsLoadingState());
    if (sports.length==0)
      {
        DioHelper.getData(
            url: 'v2/top-headlines', query: {
        'country':'Eg',
          'category':'sport',
          'apiKey':'db086fc7035a451d9db7beca0d240495'
        }).then((value) {
          sports=value.data['articles'];
          emit(GetSportsSuccessState());

        }).catchError((error){
          print('Error : ${error.toString}');
          emit(GetSportsErrorState());
        });
      }
    else {
      emit(GetSportsSuccessState());
    }

  }
void getScience(){
    emit(GetScienceLoadingState());
    if (science.isEmpty)
      {
        DioHelper.getData(
            url: 'v2/top-headlines', query: {
            'country':'Eg',
            'category':'science',
            'apiKey':'db086fc7035a451d9db7beca0d240495'}).then((value) {
              science=value.data['articles'];
              emit(GetScienceSuccessState());

        }).catchError((error){
          print('error');
          emit(GetScienceErrorState());
        });

      }
    else {
      emit(GetScienceSuccessState());
    }



}
List <dynamic> search=[];

void getBusiness(){
    if(business.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines', query: {
        'country':'Eg',
        'category':'business',
        'apiKey':'db086fc7035a451d9db7beca0d240495'}).then((value) {
        business=value.data['articles'];
        emit(GetBusinessSuccessState());
      }).catchError((error){
        print('Error');
        emit(GetBusinessErrorState());

      });
    }
    else{
      emit(GetBusinessSuccessState());
    }

}

  getSearch(String value){
    // search=[];
    emit(GetSearchLoadingState());


      DioHelper.getData(
          url: 'v2/everything', query: {
        "q":'$value',
         'apiKey':'db086fc7035a451d9db7beca0d240495'}).then((value) {
        search=value.data['articles'];
        emit(GetSearchSuccessState());

      }).catchError((error){
        print('Error');
        emit(GetSearchErrorState());

      });
    }



}
