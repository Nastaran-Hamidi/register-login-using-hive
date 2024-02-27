import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:newproject/screens/login-screen.dart';
import 'package:newproject/screens/welcome-screen.dart';

class AppRouter{
  static final route=[
    GetPage(name: '/firstscreen', page: () => const FirstScreen()),
    GetPage(name: '/welcomescreen', page: () => const WelcomeScreen())
  ];
}