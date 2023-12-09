import 'package:flutter/material.dart';

import 'button.dart';

class PremiumPlan extends StatelessWidget {
  const PremiumPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 15,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.43,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(4, 104, 78, 50),
              Color.fromRGBO(11, 149, 100, 50),
              Color.fromRGBO(17, 173, 108, 50),
            ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Premium Individual',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '₹100',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'FOR 9 MONTHS',
                      style: TextStyle(
                        color: Color.fromRGBO(136, 205, 180, 100),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              '3 months free with 6 months of \npremium / Add free music / Download to listen offline',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Button(text: "VIEW PLANS"),
            SizedBox(height: 10,),
            Text(
              'Terms and conditions apply. Open only to users who aren\'t subscribed to a recurring Premium plan and who haven\'t purchased a 12-month one-time Premium plan at a promotional price. Offer ends 8/15/24.',
              style: TextStyle(
                color: Color.fromRGBO(184, 184, 184, 10),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
