import 'package:flutter/material.dart';
import 'package:sdg_spark/screens/collaborate_screen.dart';
import 'package:sdg_spark/screens/home_screen.dart';
import 'package:sdg_spark/screens/learn_screen.dart';
import 'package:sdg_spark/welcome_screen.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, 
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF117554), 
              ),
              child: Center(
                child: Text(
                  'SDG Spark',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.black), 
                    title: const Text('Home', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.group, color: Colors.black),
                    title: const Text('Collaborate', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CollaborateScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.school, color: Colors.black),
                    title: const Text('Learn', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LearnScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF117554), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Logout', style: TextStyle(color: Colors.white)), // White text for button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
