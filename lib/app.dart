import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/routes.dart';
import 'package:rajanigandha/views/my_home_page.dart';

import 'flavors.dart';

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rajnigandha',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
    // return MaterialApp(
    //   title: F.title,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: _flavorBanner(
    //     child: MyHomePage(),
    //     show: kDebugMode,
    //   ),
    // );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
        child: child,
        location: BannerLocation.topStart,
        message: F.name,
        color: Colors.green.withOpacity(0.6),
        textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            letterSpacing: 1.0),
        textDirection: TextDirection.ltr,
      )
          : Container(
        child: child,
      );
}
