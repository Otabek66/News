import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/screens/home_pages/home_data_page.dart';
import 'package:news/screens/home_pages/home_page.dart';
import 'package:news/screens/main_page.dart';

class MyRoutes{
  Route? onGenerate(RouteSettings settings){
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx)=>const MainPage());
      case 'homedata':
       return MaterialPageRoute(builder: (ctx)=> HomeDataPage(homeData: args as Article));
    }
  }
}