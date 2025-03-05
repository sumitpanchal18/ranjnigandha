import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/routes.dart';
import 'package:rajanigandha/views/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(BaseApp());
  print("test marge");
}

class BaseApp extends StatelessWidget {
  BaseApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (_, a) {
          return GetMaterialApp(
            home:SplashScreen() ,
            textDirection: TextDirection.ltr,
            theme: ThemeData(
              fontFamily: 'URWClassico',
              primarySwatch: Colors.blueGrey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            defaultTransition: Transition.native,
            localeResolutionCallback:(
                Locale? locale,
                Iterable<Locale> supportedLocales,
                ) {
              return locale;
            },
            getPages: AppPages.pages,
            initialRoute: Routes.splash,
            debugShowCheckedModeBanner: false,
            title: 'Rajnigandha App',
          );
        });
  }
}
