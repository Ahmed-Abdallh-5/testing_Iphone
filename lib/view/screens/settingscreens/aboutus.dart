import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Our Application",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Our application is designed to make booking padel places easy and convenient for our users. We aim to provide a comprehensive platform where users can easily view all available offers and make online payments with ease.",
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  "Our Mission",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Our mission is to revolutionize the way people book and access padel facilities. We strive to create a seamless and user-friendly experience, empowering our users to find and book their ideal padel courts with just a few taps.",
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  "Why Choose Us?",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Our application offers a wide range of benefits to our users, including real-time availability updates, convenient online booking and payment options, and a user-friendly interface. We are committed to providing a reliable and efficient platform to help you enjoy your padel experience to the fullest.",
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
