import 'package:clean_architecture_projct/presentation/resources/routes_manager.dart';
import 'package:clean_architecture_projct/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {


  MyApp._internal() ;   //named constructor
  static final MyApp _instance = MyApp._internal(); // singleTone Instance2
  factory MyApp() => _instance;
   @override
   _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false ,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
      theme : getApplicationTheme()
    );
  }
}
