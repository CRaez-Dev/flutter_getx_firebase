import 'package:flutter_getx_firebase/screen/login/login_binding.dart';
import 'package:flutter_getx_firebase/screen/login/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String loginRoute = '/';


  static const String initialRoute = loginRoute;

  static final routes = <GetPage>[
    GetPage(
      name: loginRoute,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
