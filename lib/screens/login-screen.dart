import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 15,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.black),
          onPressed: () {
            Get.toNamed('/welcomescreen');
          }),
      ),
      backgroundColor: Colors.blueAccent,
      body: const SafeArea(
        child: Center(
            child: Text('Hello babe :)',
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25)
          )
        ),
      ),
    );
  }
}
