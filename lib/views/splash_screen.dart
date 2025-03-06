import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/images.dart';

import '../utils/color_constant.dart';
import '../utils/icons_constants.dart';
import '../utils/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay 2 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.dashboard);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // SVG Background
          Positioned.fill(
            child: SvgPicture.asset(
              AppImages.appBackground, // Your SVG background image
              fit: BoxFit.cover, // Ensures it covers the full screen
            ),
          ),

          // Foreground Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: precacheImage(AssetImage(AppIcons.splash2x), context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          Container(
                            width: 220,
                            height: 90,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppIcons.splash2x),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Business Club",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: ColorConstant.gd1),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}