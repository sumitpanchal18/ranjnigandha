import 'package:get/get.dart';
import 'package:rajanigandha/utils/routes.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  Future<void> onInit() async {
    // ConnectivityHelper.checkInternet();
    super.onInit();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // Future.delayed(const Duration(seconds: 3), () {
    //   // AuthController.to.checkLoginStatus();
    //   if(prefs.getString('user_details')!=null){
    //     Get.offAll(DashboardScreen());
    //   }else{
    //     Get.offAll(LoginScreen());
    //   }

      // Get.off(AccountView());

    // });

    // Get.put(home_controller());
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

}