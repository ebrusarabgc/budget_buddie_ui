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
            padding: const EdgeInsets.only(left: 80.0, right: 80.0, bottom: 50.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context){
                  return const RootApp();
                })),
            child: Container(
              decoration: BoxDecoration(
                  color: color6,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(20.0),
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