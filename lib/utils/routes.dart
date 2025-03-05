import 'package:get/get.dart';
import 'package:rajanigandha/views/cart_screen.dart';
import 'package:rajanigandha/views/dashboard_screen.dart';
import 'package:rajanigandha/views/earn_point_screen.dart';
import 'package:rajanigandha/views/login_screen.dart';
import '../views/brand_tvc_screen.dart';
import '../views/sign_up_screen.dart';
import '../views/splash_screen.dart';
import '../views/order_screen.dart';

class Routes {
  static const String splash = '/';
  static const String order = '/order';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String brandTvc = '/brandtvc';
  static const String dashboard = '/dashboard';
  static const String earnPoint = '/earnPoint';
  static const String cart = '/cart';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.order, page: () => OrderScreen()),
    GetPage(name: Routes.signUp, page: () => SignUpScreen()),
    GetPage(name: Routes.brandTvc, page: () => BrandTVCScreen()),
    GetPage(name: Routes.earnPoint, page: () => EarnPointsScreen()),
    GetPage(name: Routes.dashboard, page: () => DashboardScreen()),
    GetPage(name: Routes.cart, page: () => CartScreen()),


  ];
}
