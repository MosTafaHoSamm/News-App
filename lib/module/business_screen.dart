import 'package:appnews2/shared/components/components.dart';
import 'package:appnews2/shared/cubit/news_cubit.dart';
import 'package:appnews2/shared/cubit/news_states.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsState>(
        listener:(context,state)=>{},
        builder:(context,state){
          dynamic list = NewsCubit.get(context).business;

          return screenBuildList(list);


  });}}
