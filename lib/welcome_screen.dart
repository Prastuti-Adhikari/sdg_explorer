import 'package:flutter/material.dart';
import 'package:sdg_spark/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('11:41', style: TextStyle(fontSize: 18)),
                  Icon(Icons.signal_cellular_alt),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/sdg_wheel.png', width: 200, height: 200),
                  // const SizedBox(height: 20),
                  // const Text(
                  //   '17 Goals to\nTransform Our World',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(height: 10),
                  const Text(
                    'A tool to teach Sustainable goals',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'SDG SPARK',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Next',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                    Icon(Icons.arrow_forward,
                    color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}