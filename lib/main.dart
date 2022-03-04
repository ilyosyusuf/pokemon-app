import 'package:flutter/material.dart';
import 'package:lesson28/routes/my_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MyRoute _myRoute = MyRoute();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const MyHomePage(),
      initialRoute: '/',
      onGenerateRoute: _myRoute.onGenerateRoute,
    );
  }
}
