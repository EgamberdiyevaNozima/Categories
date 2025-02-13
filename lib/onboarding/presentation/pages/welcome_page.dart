import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../managers/onboarding_view_model.dart';

class WelcomePages extends StatelessWidget {
  final OnboardingViewModel vm;

  const WelcomePages({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.beigeColor,),
      backgroundColor: AppColors.beigeColor,
      bottomNavigationBar: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Image.asset(
                'assets/icons/img.png',
                width: 500,
                height: 900,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


















class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
