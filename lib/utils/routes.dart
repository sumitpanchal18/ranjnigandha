import 'package:get/get.dart';
import 'package:rajanigandha/views/cart_screen.dart';
import 'package:rajanigandha/views/dashboard_screen.dart';
import 'package:rajanigandha/views/earn_point_screen.dart';
import 'package:rajanigandha/views/evoucher_redeemption_screen.dart';
import 'package:rajanigandha/views/login_screen.dart';
import 'package:rajanigandha/views/redeem_cart_screen.dart';
import 'package:rajanigandha/views/transaction_detail_screen.dart';
import 'package:rajanigandha/views/transaction_history_screen.dart';
import '../views/about_us_screen.dart';
import '../views/brand_tvc_screen.dart';
import '../views/contact_us_screen.dart';
import '../views/faqs_screen.dart';
import '../views/merchandise_screen.dart';
import '../views/notification_screen.dart';
import '../views/privacy_policy_screen.dart';
import '../views/product_detail_screen.dart';
import '../views/redeem_points_screen.dart';
import '../views/redeem_product_history_screen.dart';
import '../views/redeemption_history_screen.dart';
import '../views/schemes_screen.dart';
import '../views/sign_up_screen.dart';
import '../views/splash_screen.dart';
import '../views/order_screen.dart';
import '../views/terms_and_conditions_screen.dart';
import '../views/tracking_screen.dart';
import '../views/update_profile_screen.dart';
import '../views/utilities_screen.dart';

class Routes {
  static const String splash = '/';
  static const String order = '/order';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String brandTvc = '/brandtvc';
  static const String dashboard = '/dashboard';
  static const String earnPoint = '/earnPoint';
  static const String cart = '/cart';
  static const String updateProfile = '/updateProfile';
  static const String productDetail = '/productDetail';
  static const String redeemPoints = '/redeem-points';
  static const String transactionDetail = '/transactionDetail';
  static const String contactUs = '/contactUs';
  static const String termsAndCondition = '/termsAndCondition';
  static const String aboutUs = '/aboutUs';
  static const String privacyPolicy = '/privacyPolicy';
  static const String transactionHistory = '/transactionHistory';
  static const String redeemCart = '/redeemCart';
  static const String trackingScreen = '/trackingScreen';
  static const String utilitiesScreen = '/utilitiesScreen';
  static const String merchandiseScreen = '/merchandiseScreen';
  static const String redeemPointsHistory = '/redeemPointsHistory';
  static const String redeemProductHistory = '/redeemProductHistory';
  static const String eVoucherRedeemScreen = '/eVoucherRedeemScreen';
  static const String faqsScreen = '/faqsScreen';
  static const String schemesScreen = '/schemesScreen';
  static const String notificationScreen = '/notificationScreen';

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
    GetPage(name: Routes.updateProfile, page: () => UpdateProfileScreen()),
    GetPage(name: Routes.productDetail, page: () => ProductDetailScreen()),
    GetPage(name: Routes.redeemPoints, page: () => RedeemPointsScreen()),
    GetPage(name: Routes.transactionDetail, page: () => TransactionDetailScreen()),
    GetPage(name: Routes.contactUs, page: () => ContactUsScreen()),
    GetPage(name: Routes.redeemCart, page: () => RedeemScreen()),
    GetPage(name: Routes.transactionHistory, page: () => TransactionHistoryScreen()),
    GetPage(name: Routes.termsAndCondition, page: () => TermsAndConditionsScreen()),
    GetPage(name: Routes.aboutUs, page: () => AboutUsScreen()),
    GetPage(name: Routes.privacyPolicy, page: () => PrivacyPolicyScreen()),
    GetPage(name: Routes.trackingScreen, page: () => TrackingScreen()),
    GetPage(name: Routes.utilitiesScreen, page: () => UtilitiesScreen()),
    GetPage(name: Routes.merchandiseScreen, page: () => MerchandiseScreen()),
    GetPage(name: Routes.redeemPointsHistory, page: () => RedemptionHistoryScreen()),
    GetPage(name: Routes.redeemProductHistory, page: () => RedeemProductHistroyScreen()),
    GetPage(name: Routes.eVoucherRedeemScreen, page: () => EVoucherRedemptionsScreen()),
    GetPage(name: Routes.faqsScreen, page: () => FAQScreen()),
    GetPage(name: Routes.schemesScreen, page: () => SchemesScreen()),
    GetPage(name: Routes.notificationScreen, page: () => NotificationScreen()),
  ];
}
