import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        title: const Text('Help and Support', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const FAQItem(
              question: 'How do I create an account?',
              answer: 'To create an account, click on the "Sign Up" button and follow the instructions.',
            ),
            const FAQItem(
              question: 'How do I reset my password?',
              answer: 'To reset your password, go to the login page and click on the "Forgot Password" link.',
            ),
            const FAQItem(
              question: 'How do I contact support?',
              answer: 'You can contact support by emailing support@example.com or calling +1234567890.',
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Still need help?',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Implement support contact functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Change the button color as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Adjust the border radius
                ),
              ),
              child: const Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Text(
          answer,
          style: const TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}