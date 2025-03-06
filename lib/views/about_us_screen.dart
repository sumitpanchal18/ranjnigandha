import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';
import 'package:rajanigandha/utils/color_constant.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "About",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(
                      'Welcome to the rajnigandha business club'),
                  SizedBox(height: 12),
                  _buildSectionSubTitle(
                    'Where loyalty reaps you with rewards, and our partnerships flourish.',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    "Our program is designed to cultivate strong, value-driven relationships with business partners who are key players in our brand's success story. Join us on this exciting journey and make it a rewarding one",
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    "By joining our rewards program, you'll enjoy exclusive benefits that will take your business to new heights.",
                  ),
                  _buildRewardHeader(text: "How to Earn Points"),

                  // Earn Points Cards
                  _buildEarnPointsCard(
                    title: 'Master Carton',
                    description:
                        'Begin Your Journey By Purchasing Rajnigandha Carton Of Selected SKUs',
                  ),
                  SizedBox(height: 16),
                  _buildEarnPointsCard(
                    title: 'Earn Points',
                    description:
                        'Accumulate Points With Every Master Carton Purchase',
                  ),
                  SizedBox(height: 16),
                  _buildEarnPointsCard(
                    title: 'Redeem & Rejoice',
                    description:
                        'Exchange Points For DSL Products, Multi-Brand E-Vouchers, Experiential Rewards, Merchandises & Many More.',
                  ),

                  _buildRewardHeader(text: "What's in it for you"),
                  _buildRewardList(),

                  _buildRewardHeader(text: "The More The Rewards\nThe Merrier"),
                  SizedBox(
                    height: 500,
                    child: _rewardStepsWidget(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rewardStepsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          _rewardStep(
            stepNumber: '1',
            title: 'Exclusive Deals & Surprises',
            description:
                'You\'ll Get Access To Exclusive Deals And Surprises Throughout The Year.',
          ),
          SizedBox(height: 10),
          _rewardStep(
            stepNumber: '2',
            title: 'Share Feedback',
            description:
                'Your Opinion Matters To Us. Provide Your Valuable Feedback About Our Loyalty Program And Get Rewarded.',
          ),
          SizedBox(height: 10),
          _rewardStep(
            stepNumber: '3',
            title: 'Update Your Profile',
            description:
                'Update Your Profile With Details Like Your Birthday And Address To Get Rewarded With Loyalty Points.',
          ),
        ],
      ),
    );
  }

  Widget _rewardStep({
    required String stepNumber,
    required String title,
    required String description,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0, // half over the edge
          child: CircleAvatar(
            radius: 20,
            backgroundColor: ColorConstant.boxbgclrproduct,
            child: Text(
              stepNumber,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRewardHeader({required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSectionSubTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white70,
        height: 1.5,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildEarnPointsCard({
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFFA000)], // Golden gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 18),
          Expanded(
            flex: 4,
            child: Text(
              description,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardList() {
    return SizedBox(
      height: 265,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRewardCard(
            icon: Icons.card_giftcard,
            title: 'Exciting Birthday Rewards',
            description:
                'Enjoy Exciting Surprises Sent To You During Your Birthday Month.',
          ),
          const SizedBox(width: 16),
          _buildRewardCard(
            icon: Icons.emoji_events,
            title: 'Enhanced Rewards With Every Milestone',
            description:
                'Upgrade Your Tier To Receive More Benefits With Every Milestone.',
          ),
          const SizedBox(width: 16),
          _buildRewardCard(
            icon: Icons.redeem,
            title: 'Exclusive Redemption Offers',
            description:
                'Redeem your points for exclusive offers and premium gifts.',
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFFA000)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF03174C),
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
