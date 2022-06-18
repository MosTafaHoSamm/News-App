
import 'package:appnews2/shared/components/constants.dart';
import 'package:appnews2/shared/cubit/dark_cubit.dart';
import 'package:appnews2/shared/cubit/dark_states.dart';
import 'package:appnews2/shared/cubit/news_cubit.dart';
import 'package:appnews2/shared/local/cache_helper.dart';
import 'package:appnews2/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home_layout/home_layout.dart';


 void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
   bool  isDark =  CacheHelper.getBool(key: 'isDark');

  runApp(AppNews(isDark));

}
class AppNews extends StatelessWidget {
    final isDark;
    AppNews(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create:(context)=>NewsCubit()..getSports()..getScience()..getBusiness()
        ),
        BlocProvider(
            create:(context)=>DarkCubit()..changeMode(fromShared: isDark)
        ),
      ],
      child: BlocConsumer<DarkCubit,DarkState>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            theme: themeLight,
            darkTheme: themeDark
            , themeMode:DarkCubit.get(context).isDark ?ThemeMode.dark:ThemeMode.light,
            home: HomeLayout(),
            debugShowCheckedModeBanner: false,
          );
        },

      ),
    );
  }
}

