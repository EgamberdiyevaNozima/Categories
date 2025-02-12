import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      
      appBar: AppBar(
        leading: Image.asset("assets/icons/back-arrow.svg"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset("assets/icons/drink.png"),
              ],
            )
            // const SizedBox(height: 40),
            // const Text(
            //   'Welcome!',
            //   style: TextStyle(fontSize: 28, color: Colors.white),
            // ),
            // const SizedBox(height: 10),
            // const Text(
            //   'Find the best recipes and improve your skills!',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 16, color: Colors.white70),
            // ),
            // const SizedBox(height: 20),
            // const Expanded(child: ImageGrid()),
            // CustomButton(
            //   text: "I'm New",
            //   onPressed: () {},
            // ),
            // const SizedBox(height: 10),
            // CustomButton(
            //   text: "I've Been Here",
            //   onPressed: () {},
            // ),
            // const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
