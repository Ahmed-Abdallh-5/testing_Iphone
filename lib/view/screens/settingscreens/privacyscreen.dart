import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          "Privacy & Policy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            "Privacy & Policy",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "We respect your privacy and are committed to protecting your personal information. This policy outlines how we collect, use, disclose, and safeguard your data.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "Information We Collect",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "When you create an account, we collect your name, email address, phone number, and password. You may also choose to provide a profile picture.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            "We use email, Gmail, and Google authentication to secure your account. When you sign in using these methods, certain information may be shared with us, such as your name and email address.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "How We Use Your Information",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "We use your information to provide and improve our services, process payments, communicate with you, and comply with legal requirements.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "Data Security",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "We implement robust security measures to protect your personal information from unauthorized access, disclosure, or modification.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "Data Sharing",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "We may share your information with trusted third-party service providers to facilitate our services. These providers are obligated to protect your data.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "User Rights",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "You have the right to access, rectify, or erase your personal data. To exercise these rights, please contact us at [email protected]",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "Payment Information",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "We use paymob as our payment processor. We do not store your full credit card information. Instead,  paymob securely handles your payment data. You can review  paymob's privacy policy for more details on how they protect your payment information.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            "9. Entire Agreement",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "These Terms and Conditions constitute the entire agreement between you and us regarding the use of the Padel Sport app and supersede all prior or contemporaneous communications, representations, or agreements, whether oral or written.",
          ),
          SizedBox(height: 16.0),

          // Section 10: Severability
        ],
      ),
    );
  }
}
