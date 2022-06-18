import 'package:appnews2/shared/components/components.dart';
import 'package:appnews2/shared/cubit/news_cubit.dart';
import 'package:appnews2/shared/cubit/news_states.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:webview_flutter/webview_flutter.dart';
class WebViewM extends StatelessWidget {
  final String url;
  WebViewM(this.url);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(),
      body:WebView(
        initialUrl:url ,)
    );




  }}
