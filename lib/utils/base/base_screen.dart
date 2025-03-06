import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/color_constant.dart';

import '../../widgets/custom_button.dart';
import '../images.dart';
import '../routes.dart';

class BaseScreen extends StatefulWidget {
  final Widget body;
  final String title;
  final Widget? leftButton;
  final Widget? rightButton;

  const BaseScreen({
    super.key,
    required this.body,
    required this.title,
    this.leftButton,
    this.rightButton,
  });

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Global Key for Drawer
  int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key here
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AppImages.appBackground, // Your SVG background image
              fit: BoxFit.cover, // Ensures it covers the full screen
            ),
          ),
          SafeArea(child: widget.body)
        ],
      ), // Dynamic content for each screen
      bottomNavigationBar: _buildNavBar(),
      extendBodyBehindAppBar: true,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: ModalRoute.of(context)?.settings.name == Routes.dashboard
    ? IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      )
          : IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Get.back(),
      ),
      actions: [
        if (widget.rightButton != null) widget.rightButton!,
      ],
    );
  }



  /// 🔹 Custom Drawer
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF020E3F),
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem("Dashboard", Icons.dashboard, 0),
                _buildDrawerItem("My Account", Icons.person, 1),
                _buildDrawerItem("Earn Points", Icons.monetization_on, 2),
                _buildDrawerItem("Transaction History", Icons.history, 3),
                _buildDrawerItem("Redeem Points", Icons.card_giftcard, 4),
                _buildDrawerItem("Track Your Order", Icons.track_changes, 5),
                _buildDrawerItem("Refund Point Details", Icons.track_changes, 6),
                _buildDrawerItem("About The Program", Icons.info, 7),
                _buildDrawerItem("Schemes", Icons.info, 8),
                _buildDrawerItem("TVC Brands", Icons.info, 9),
                _buildDrawerItem("My Redemptions", Icons.info, 10),
                _buildDrawerItem("FAQs", Icons.help, 11),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  /// 🔹 Drawer Header (User Info)
  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstant.gd2, // Border color
                width: 1, // Border width
              ),
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
          ),

          SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.updateProfile);
                  },
                  child: const Text(
                    "Srishti Sharma",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  "Point Balance 604",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 🔹 Drawer List Item
  Widget _buildDrawerItem(String title, IconData icon, int index) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Get.back(); // Close the drawer
        if(index == 5){
          Get.toNamed(Routes.order);
        }
        if(index == 2){
          Get.toNamed(Routes.earnPoint);
        }
        //3
        if(index == 3){
          Get.toNamed(Routes.transactionHistory);
        }
        //4
        if(index == 4){
          Get.toNamed(Routes.redeemPoints);
        }
        //7
        if(index == 7){
          Get.toNamed(Routes.aboutUs);
        }
        //8
        if(index == 8){
          Get.toNamed(Routes.schemesScreen);
        }
        //9
        if(index == 9){
          Get.toNamed(Routes.brandTvc);
        }
        //10
        if(index == 10){
          Get.toNamed(Routes.eVoucherRedeemScreen);
        }
        //11
        if(index == 11){
          Get.toNamed(Routes.faqsScreen);
        }

      },
    );
  }

  /// 🔹 Logout Button
  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: AppGradientButton(
        onPressed: () {
          // Perform logout action
        }, text: "Logout",
      ),
    );
  }
  Widget _buildNavBar() {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory, // Disables ripple effect
        highlightColor: btnbordercolor.gd2, // Removes highlight effect
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFF020E3F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.redeem),
            label: 'Redeem',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: ColorConstant.buttonColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.qr_code,
                size: 30,
                color: Colors.white,
              ),
            ),
            label: 'Scan & Earn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

}