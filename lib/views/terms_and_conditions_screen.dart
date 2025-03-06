import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rajanigandha/utils/base/base_screen.dart';
import 'package:rajanigandha/utils/base/base_screen_two.dart';

import '../utils/images.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreenTwo(
      title: "Terms & Conditions",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('DEFINITIONS'),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '1. A Rajnigandha Business Club member is an individual who purchases specific Master Carton SKUs from Dharampal Satyapal Limited and is officially enrolled as a member in the Rajnigandha Business Club. Membership is granted with a valid and active participation in the program, and members are obligated to adhere to the rules established by the Rajnigandha Business Club, which is owned by Dharampal Satyapal Limited. These rules are subject to change.',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '2. Rajnigandha Business Club Membership Account means an individual account created for every Rajnigandha Business Club member during his online (Web/App) enrolment into the Rajnigandha Business Club Loyalty program. Rajnigandha Business Club Membership account is where Rajnigandha Business Club reward poins will be accumulated for accrual and/or redemption.',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '3. Rajnigandha Reward Point(s) is the unit currency of the program. Rajnigandha Business Club Members are awarded Rajnigandha Reward points for earning activities carried out by the Rajnigandha Business Club Member.',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    "4. The term 'Loyalty Program' refers to the Rajnigandha Business Club loyalty program, which is managed and operated by Dharampal Satyapal Limited. This program provides benefits, facilities, or arrangements to Rajnigandha Business Club Members based on their membership. Rajnigandha Reward points are earned by Rajnigandha Business Club Members through various Earn Activities, and these points can be utilized by members for redemption through the Rajnigandha Rewards Catalogue and Redemption.",
                  ),
                  SizedBox(height: 16),
                  _buildSectionTitle('TERMS AND CONDITIONS'),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '1. Participation in the Rajnigandha Business Club is optional, without any associated charges, and is available to individuals who purchase Dharampal Satyapal Limited Master Carton products. To qualify, individuals must have a valid email address, mobile number, coupon code, and residential address. Additionally, membership is restricted to Indian citizens residing in India, who are above the age of 18 and meet the eligibility criteria as defined by the membership rules established by the business. Please note that these rules are subject to modification without advance notice.',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '2. Each member of the Rajnigandha Business Club is allowed a maximum of one membership, unless otherwise specified. In the event that a member is identified as having multiple memberships within the Program, Rajnigandha Business Club reserves the right to impose restrictions on any of the duplicated memberships. Additionally, Rajnigandha Business Club may choose to consolidate the accounts associated with such members.',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '3. In the event that a Rajnigandha Business Club Member holds more than one membership, it is recommended that the member contacts the Rajnigandha Business Club Contact Centre to request account aggregation. Upon such a request, the Rajnigandha Business Club Member should proceed to cancel the membership(s) they do not wish to retain and transfer any earned Rajnigandha Business Club points into a single Rajnigandha Business Club Membership Account.',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    "4. All information provided by the Rajnigandha Business Club Member must be valid, accurate, and maintained as current. Specifically, the Rajnigandha Business Club Member is responsible for the accuracy of their (i) name, (ii) email address, (iii) PAN number, (iv) mobile number, (v) mailing address, etc. If there are any changes or updates to the Rajnigandha Business Club Member's details, it is the sole responsibility of the member to promptly inform the Rajnigandha Business Club by contacting the Rajnigandha Business Club Contact Centre and ensuring that the relevant information is updated or modified. Rajnigandha Business Club will not be held responsible for any loss incurred or suffered due to incorrect, incomplete, or inaccurate information provided by the Rajnigandha Business Club Member.",
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    "5. By utilizing their Rajnigandha Business Club membership and/or providing their Rajnigandha Business Club number to Dharampal Satyapal Limited, a Rajnigandha Business Club Member gives consent to Dharampal Satyapal Limited for the creation, storage, maintenance, and updating of the Rajnigandha Business Club Member's data. This data encompasses membership details (such as name, address, PAN number, mobile number, email address, date of birth, preferences, etc., as supplied by the Rajnigandha Business Club Member), usage data (including, but not limited to, transactions and accrued Rajnigandha Business Club reward points), and information related to interactions with Dharampal Satyapal Limited (including, but not limited to, inquiries regarding membership) for the purpose of delivering relevant information and customer services to the Rajnigandha Business Club Member in connection with the Program. All data concerning Rajnigandha Business Club Members will be safeguarded and utilized by Dharampal Satyapal Limited in accordance with the guidelines outlined in Dharampal Satyapal Limited's (Rajnigandha Business Club) Privacy Policy..",
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '6. Members of the Rajnigandha Business Club have the chance to collect Rajnigandha Reward points. These points can be earned by members through activities such as updating the unique coupon code (found inside selected products of Dharampal Satyapal Limited) via the website or mobile application. Additionally, members can earn points by participating in various activities organized by the Rajnigandha Business Club from time to time. .',
                  ),
                  SizedBox(height: 12),
                  _buildParagraph(
                    '7. Members of the Rajnigandha Business Club will receive Rajnigandha reward points not only for transactional activities but also for non-transactional activities, including bonus points. Information about bonus points will be communicated periodically through www.business.rajnigandha.com or through alternative means of communication as determined by the Rajnigandha Business Club from time to time.',
                  ),

                ],
              ),
            ),
          ),
        ],
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

  Widget _buildYourQuery(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white70,
        height: 1.5,
      ),
      // textAlign: TextAlign.justify,
    );
  }

}
