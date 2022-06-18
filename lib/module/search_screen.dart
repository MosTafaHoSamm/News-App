import 'package:appnews2/shared/components/components.dart';
import 'package:appnews2/shared/cubit/news_cubit.dart';
import 'package:appnews2/shared/cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context, state) => {},
      builder: (context, state) {

        dynamic list = NewsCubit.get(context).search;

        return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormField(
                    validate: (value){
                      if(value.isEmpty)
                        {
                          return'Enter Value to find Result !';
                        }
                      return null;
                    },
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);

                    },
                    controller: controller,
                  label: 'Search',
                  icon:  Icons.search,radius: 10
                  ),
                  Expanded(child: screenBuildList(list, isSearch: true)),
                ],
              ),
            ));
      },
    );
  }
}
