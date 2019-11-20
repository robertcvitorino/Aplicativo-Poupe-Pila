
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poupe/app/modules/home/home_page.dart';
import 'package:poupe/app/modules/home/subpages/cart/cart_page.dart';
import 'package:poupe/app/modules/home/subpages/favorite/favorite_page.dart';
import 'package:poupe/app/modules/home/subpages/search/search_page.dart';
import 'package:poupe/app/modules/login/login_page.dart';
import 'package:poupe/app/modules/login/subpages/create/create_page.dart';

class Router{
    static Route<dynamic> generateRoute(RouteSettings settings){
      switch (settings.name) {

        case '/':        
          return GetRoute(settings: settings, builder:(_)=>LoginPage());                      
         
        case '/Create':
          return GetRoute(settings: settings,builder: (_)=>CreatePage());

        case '/Home':
          return GetRoute(settings: settings,builder: (_)=>HomePage());

        case '/Search':
          return GetRoute(settings: settings,builder: (_)=>SearchPage());
        
         case '/Favorite':
          return GetRoute(settings: settings,builder: (_)=>FavoritePage());

          case '/Cart':
          return GetRoute(settings: settings,builder: (_)=>CartPage());        

        
        default:
          return GetRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
      }
    }



}