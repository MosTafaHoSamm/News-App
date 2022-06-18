import 'package:appnews2/module/web_view.dart';
import 'package:appnews2/shared/cubit/news_cubit.dart';
import 'package:appnews2/shared/cubit/news_states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 Widget articleBuildItem( article,context){
   var url=   '${article['urlToImage']}' ;
   var url2=   'https://data.whicdn.com/images/339795084/original.png';
   // for(int i=0;i<=article.length;i++)
   //   {
   //     print('img =${url}');
   //   }

   return  Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: (){
        navigateTo( context,WebViewM(article['url']));
      },
      child: Row(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(url=='null'?url2:url),
                  fit: BoxFit.cover,


                )
            ),

          ),
          SizedBox(
            width: 20,
          ),

          Expanded(
            child: Container(height: 150
              ,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,

                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${article['publishedAt']}',style: Theme.of(context).textTheme.bodyText2,),

                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
Widget screenBuildList(
    list,{isSearch=false}
    )
{
  return BlocConsumer<NewsCubit,NewsState>(
    listener: (context,state){},
    builder: (context,state){
      return ConditionalBuilder(
        condition: list.length>0,
        builder: (context){
          return  ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>articleBuildItem(list[index], context),
              separatorBuilder:  (context,index)=>divider(),
              itemCount: list.length);

        },
        fallback: (context){
          return Center(
            child: isSearch?Container():CircularProgressIndicator(),
          );
        },

      );
    },

  );
}
Widget divider(){
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 15.0),
    child: Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    ),
  );
}
  navigateTo(context,widget)
{
  Navigator.push(context, MaterialPageRoute(builder: (context)
  {
    return widget;
  }
  ));
}
Widget defaultFormField
    (
{
   TextEditingController controller,
   Function  onChange,
   Function  validate,
   Function(String value)  onSubmit,
  TextInputType  type,
  IconData  icon,
  String  label,
  double radius



}
    )
{
  return Container(
    height: 100,
    width: double.infinity,
    child: TextFormField(
validator: (value){
  validate(value);
},
    controller: controller,
      onChanged: (s){onChange(s);},
      onFieldSubmitted: onSubmit,
      keyboardType: type,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius )
          ),
        prefixIcon:Icon(icon),
        label: Text(label ),


      ),
    ),
  );
}
