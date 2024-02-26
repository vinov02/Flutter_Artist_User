import 'package:flutter/material.dart';

class ShareAndEarnPage extends StatefulWidget {
  const ShareAndEarnPage({super.key});

  @override
  State<ShareAndEarnPage> createState() => _ShareAndEarnPageState();
}

class _ShareAndEarnPageState extends State<ShareAndEarnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        title: const Text('Share & Earn', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://www.bestar.ca/wp-content/uploads/2020/11/share-and-earn-video-poster.jpg', // Replace with your image URL
              height: 200.0, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Share and Earn',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Invite friends to join and earn rewards!',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement sharing functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Change the button color as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Adjust the border radius
                ),
              ),
              child: const Text('Share Now'),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Your Referral Code:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'ABC123', // Replace with the user's referral code
              style: TextStyle(fontSize: 20.0, color: Colors.green),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Share this code with your friends and earn rewards when they sign up!',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}