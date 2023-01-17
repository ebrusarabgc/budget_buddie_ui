import 'package:flutter/material.dart';
import 'root_app.dart';
import '../theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 80.0, bottom: 20.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              'Master your money, rule your future!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context){
                  return const RootApp();
                })),
            child: Container(
              decoration: BoxDecoration(
                  color: color6,
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                'Get Started',
                style: TextStyle(
                    color: white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}