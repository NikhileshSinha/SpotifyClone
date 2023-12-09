import 'package:flutter/material.dart';
import 'package:spotify_clone/Premium/Widgets/premiumPlan.dart';

import '../BottomNavigation.dart';
import 'Widgets/Cards.dart';
import 'Widgets/button.dart';
import 'Widgets/currentPlan.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        body: ListView(
          children: [
            SizedBox(height: 75,),
            Text(
              "Get 9 months of\nPremium for ₹719",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'LibreFranklin',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Cards(),
            Button(text: "GET PREMIUM"),
            SizedBox(height: 10,),
            Text(
                'Terms and conditions apply. Open only to users who aren\'t subscribed to a recurring Premium plan and who haven\'t purchased a 12-month one-time Premium plan at a promotional price. Offer ends 8/15/24.',
              style: TextStyle(
                color: Color.fromRGBO(184, 184, 184, 10),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            CurrentPlan(),
            PremiumPlan(),
          ],
        ),
        bottomNavigationBar: BottomBar(3),
      ),
    );
  }
}
