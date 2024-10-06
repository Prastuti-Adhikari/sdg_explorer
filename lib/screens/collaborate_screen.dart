import 'package:flutter/material.dart';

class CollaborateScreen extends StatelessWidget {
  const CollaborateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collaborate'),
        backgroundColor: const Color(0xFF117554),
      ),
      body: const Center(
        child: Text('This is the Collaborate screen'),
      ),
    );
  }
}