import 'dart:convert';

import 'package:artist_community_user/Services/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:artist_community_user/pages/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int selectedControl = 0;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken');
    if (token != null) {
      try {
        final response = await http.get(
          Uri.parse('$baseURL/user/dashboard'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          setState(() {
            _userName = jsonData['name'];
          });
        } else {
          throw Exception('Failed to load user data: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching user data: $e');
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined,color: Colors.black,),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),

        ],
      ),
      body: Column(
        children: [
            Row(
            children: [
              const SizedBox(width: 10,),
              const CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/vino.jpg'),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_userName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins'
                  ),
                  ),
                  const Text('Member since 2024',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                    ),
                  )
                ],
              ),
              const SizedBox(width: 100,),
            ],
          ),
          const SizedBox(height: 10,),
          const Row(
            children: [
              SizedBox(width: 25,),
              Icon(Icons.location_on_outlined,size: 10,),
              Text('Kochi',style: TextStyle(fontSize: 12),)
            ],
          ),
          const SizedBox(height: 20,),
          Center(
            child: CupertinoSlidingSegmentedControl(
              groupValue: selectedControl,
              children: const <int, Widget>{
                0: Text('My Collection'),
                1: Text('Insights '),
                2: Text('Saves'),
              },
              onValueChanged: (value) {
                setState(() {
                  selectedControl = value!;
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: selectedControl == 0
                  ? _buildFirstSegmentContents()
                  : selectedControl == 1? _buildSecondSegmentContents()
                  : _buildThirdSegmentContents(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstSegmentContents() {
    return SingleChildScrollView(
      child: Column(

        children: [
          const SizedBox(height: 30,),
          const Text('Know Your Collection Better',
          style: TextStyle(
            fontSize: 17
          ),
          ),
          const SizedBox(height: 10,),
          const Text('Manage your collection online and get free market insights.',
            style: TextStyle(
                fontSize: 13
            ),
          ),
          const SizedBox(height: 10,),
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzBHRq1mVk_hcoUKJUdFWwVDEkf0VbYrDlXDliX1CCnS6mhllEraa6_lfbGcpBBpWyx2I&usqp=CAU"),
          const SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 105, vertical: 20), // Adjust the values to resize the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {

            },
            child: const Text('Add to My Collection',
              style: TextStyle(
              color: Colors.white,
                fontSize: 16
            ),),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondSegmentContents() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This is the content for the Second Segment'),
        Text('You can add more widgets here.'),
      ],
    );
  }
}

Widget _buildThirdSegmentContents() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('This is the content for the Third Segment'),
    ],
  );
}
