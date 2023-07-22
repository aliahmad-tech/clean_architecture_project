import 'package:clean_architecture_projct/presentation/forgot_password/forgot_password_view.dart';
import 'package:clean_architecture_projct/presentation/login/login_view.dart';
import 'package:clean_architecture_projct/presentation/main/main_view.dart';
import 'package:clean_architecture_projct/presentation/on_boarding/view/on_boarding_view.dart';
import 'package:clean_architecture_projct/presentation/register/register_view.dart';
import 'package:clean_architecture_projct/presentation/resources/strings_manager.dart';
import 'package:clean_architecture_projct/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../store_details/store_details_view.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
  static const String onBoardingScreenRoute = '/onBoardingScreen';
}
class RouteGenerator {
  static Route <dynamic> getRoute (RouteSettings settings)
  {
    switch(settings.name) {
      case RoutesManager.splashRoute :
      return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesManager.loginRoute :
      return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesManager.registerRoute :
      return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutesManager.forgotPasswordRoute :
      return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case RoutesManager.mainRoute :
      return MaterialPageRoute(builder: (_) => const MainView());
      case RoutesManager.storeDetailsRoute :
      return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      case RoutesManager.onBoardingScreenRoute :
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default :
        return undefinedRoute();
    }
  }
 static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (_) =>  Scaffold(
      appBar: AppBar(
         title: const Text(AppStrings.noRouteFound),
      ),
      body: const Center(child:  Text('hai 😘😘😘😘😘😘')),
    ));
 }
}