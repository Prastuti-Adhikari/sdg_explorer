import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        backgroundColor: const Color(0xFF117554),
      ),
      body: const Center(
        child: Text('This is the Learn screen'),
      ),
    );
  }
}