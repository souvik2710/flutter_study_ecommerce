import 'package:ecommerce_app/cartpage.dart';
import 'package:ecommerce_app/front_page.dart';
import 'package:ecommerce_app/home_page.dart';
import 'package:flutter/material.dart';

import 'bottomnavbar.dart';


//navigation_three (page three) not included
class AppRoutes {
  static const cartDesign="cartDesignpage";
  static const userDesign1="userDesignpage";
  static const homePage="homepagedesign";
  static const bottomnavbar="bottomnavbarpagedesign";

}
class AppRouter{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name){
      case AppRoutes.cartDesign:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>CartPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.userDesign1:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>frontpageDesign(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>HomePageDesign(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.bottomnavbar:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>BottomNav(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
}