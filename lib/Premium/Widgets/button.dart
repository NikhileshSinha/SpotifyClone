import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Button extends StatefulWidget {
  const Button({super.key, required this.text});
  final String text;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  late Razorpay _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckOut() async{
    try{
      _razorpay.open({
        'name' : 'spotify premium',
        'key' : 'rzp_live_ILgsfZCZoFIKMB',
        'amount' : 100,
        'retry' : {'enabled': true, 'max_count': 1},
        'send_sms_hash' : true,
        'prefill' : { 'contact': '7652038581', 'email' : 'sinhanikhilesh1997@gmail.com' },
        'external' : {
          'wallets' : ['paytm']
        }
      }
      );
    }catch(e){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
        child: TextButton(
          onPressed: openCheckOut,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),

            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 2,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
