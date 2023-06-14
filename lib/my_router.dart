

import 'package:flutter/material.dart';
import 'package:untitled1/const_route.dart';
import 'package:untitled1/page1.dart';
import 'package:untitled1/undefinedPage.dart';

import 'Page2.dart';

class MyRouter{
  static Route generatrRoutes(RouteSettings settings){
    switch (settings.name){
      case homePage:
        return _route(Page1());
      case page1:
        return _route(Page2());
        
      default:
        {
          return _route(UndefinedPage());
        }
    }
  }
  static MaterialPageRoute _route(Widget page){
    return MaterialPageRoute(builder: (_)=>page);
  }
}