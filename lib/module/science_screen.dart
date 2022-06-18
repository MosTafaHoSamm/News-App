import 'package:appnews2/shared/components/components.dart';
import 'package:appnews2/shared/cubit/news_cubit.dart';
import'package:flutter/material.dart';
class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   var list=NewsCubit.get(context).science;
    return screenBuildList(list);
  }
}
