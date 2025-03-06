import 'package:flutter/material.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'FAQs',
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Background color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: ExpansionTile(
                collapsedIconColor: Colors.white.withOpacity(0.7),
                title: Text(
                  'How do I log in to my Rajnigandha Business Account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Step 1- Login to your Rajnigandha Business Club account.\n\n'
                          'Step 2 – Select “My Profile”, and click on update your personal details.'
                          ' Earn additional reward points by updating your Rajnigandha Business Club profile.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Background color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: ExpansionTile(
                collapsedIconColor: Colors.white.withOpacity(0.7),
                title: Text(
                  'How do I update my account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Step 1- Login to your Rajnigandha Business Club account.\n\n'
                          'Step 2 – Select “My Profile”, and click on update your personal details.'
                          ' Earn additional reward points by updating your Rajnigandha Business Club profile.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Background color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: ExpansionTile(
                collapsedIconColor: Colors.white.withOpacity(0.7),
                title: Text(
                  'How do I reset/change a user account password?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Instructions for resetting or changing your password.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Background color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: ExpansionTile(
                collapsedIconColor: Colors.white.withOpacity(0.7),
                title: Text(
                  'Can I transfer my Rajnigandha Business Account to another person’s name?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Information about transferring the account.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Background color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: ExpansionTile(
                collapsedIconColor: Colors.white.withOpacity(0.7),
                title: Text(
                  'How can I cancel my Rajnigandha Business Membership/account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Steps to cancel your membership or account.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Background color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: ExpansionTile(
                collapsedIconColor: Colors.white.withOpacity(0.7),
                title: Text(
                  'How to reactivate my account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Instructions on reactivating your account.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
