import 'package:flutter/material.dart';
import 'package:lesson28/models/pocemon_model.dart';
import 'package:lesson28/screens/details.dart';
import 'package:lesson28/screens/homepage.dart';
import 'package:lesson28/screens/searchpage.dart';
import 'package:lesson28/screens/splashpage.dart';

class MyRoute{
  Route? onGenerateRoute(RouteSettings settings){
    var arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=> SplashPage());
      case '/home':
        return MaterialPageRoute(builder: (_)=> MyHomePage());
      case '/search':
        return MaterialPageRoute(builder: (_)=> SearchPage(pModel: arguments as List<Pokemon>));
            case '/details':
        return MaterialPageRoute(builder: (_)=> DetailsPage( detail: arguments as Pokemon));
    }
  }
}