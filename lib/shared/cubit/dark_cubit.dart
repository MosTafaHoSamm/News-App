
import 'package:appnews2/module/business_screen.dart';
import 'package:appnews2/module/science_screen.dart';
import 'package:appnews2/module/sport_screen.dart';
import 'package:appnews2/shared/local/cache_helper.dart';
import 'package:appnews2/shared/network/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dark_states.dart';
import 'news_states.dart';

class DarkCubit extends Cubit <DarkState>{
  DarkCubit():super(IntialDarkState());

  static DarkCubit get(context)=>BlocProvider.of(context);
  bool  isDark = false;
  void changeMode({bool  fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeStaste());
    }
    else {
      isDark = !isDark ;
      CacheHelper.putBool(key: 'isDark', value: isDark ).then((value) {
        emit(ChangeModeStaste());
      });
    }
  }
}
