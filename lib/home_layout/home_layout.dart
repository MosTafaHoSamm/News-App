
import 'package:appnews2/module/search_screen.dart';
import 'package:appnews2/shared/components/components.dart';
import 'package:appnews2/shared/cubit/dark_cubit.dart';
import 'package:appnews2/shared/cubit/news_cubit.dart';
import 'package:appnews2/shared/cubit/news_states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state)=>{},
      builder: (context,state){
        NewsCubit cubit = NewsCubit.get(context);

        return
        Scaffold(


            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){
                   // navigateTo(context,SearchScreen());
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                }, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  DarkCubit.get(context).changeMode();

                }, icon: Icon(Icons.brightness_2_outlined)),
                SizedBox(width: 20,),

              ],
              title:Text('News App'),

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add),
            ),
            bottomNavigationBar:BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: NewsCubit.get(context).items,

            )
            ,
            body: cubit.screens[cubit.currentIndex],




            );
      },


    );


    }
}
