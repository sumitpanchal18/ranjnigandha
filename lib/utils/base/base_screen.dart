import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rajanigandha/utils/color_constant.dart';

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
          Container(
              padding: EdgeInsets.only(top: AppBar().preferredSize.height+10),
              color: Colors.transparent,
              child: widget.body
          )
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildDrawerItem("Dashboard", Icons.dashboard, 0),
          _buildDrawerItem("My Account", Icons.person, 1),
          _buildDrawerItem("Earn Points", Icons.monetization_on, 2),
          _buildDrawerItem("Transaction History", Icons.history, 3),
          _buildDrawerItem("Redeem Points", Icons.card_giftcard, 4),
          _buildDrawerItem("Track Your Order", Icons.track_changes, 5),
          _buildDrawerItem("About The Program", Icons.info, 6),
          _buildDrawerItem("FAQs", Icons.help, 7),
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
                const Text(
                  "Srishti Sharma",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
      leading: Icon(icon, color: Colors.white),
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

      },
    );
  }

  /// 🔹 Logout Button
  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.offAllNamed(Routes.login); // Navigate to login screen and remove all previous routes
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text("Logout", style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }

  Widget _buildNavBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF020E3F),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) {
      },
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
    );
  }
}