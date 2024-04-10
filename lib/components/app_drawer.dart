import 'dart:convert';
import 'package:artist_community_user/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:artist_community_user/pages/user_profile.dart';
import 'package:artist_community_user/pages/notifation_page.dart';
import 'package:artist_community_user/pages/settings_page.dart';
import 'package:artist_community_user/pages/share_and_earn_page.dart';
import 'package:artist_community_user/pages/help_and_support_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _userName = '';
  String _email = '';

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
            _email = jsonData['email'];
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF7888DE),
                  Color(0xFFABDBE6),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/vino.jpg'),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    _userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                   Text(
                    _email,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,color: Colors.black),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person,color: Colors.black),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications,color: Colors.black),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings,color: Colors.black),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help,color: Colors.black),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpAndSupportPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share,color: Colors.black),
            title: const Text('Share & Earn'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ShareAndEarnPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Handle tap on Logout
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
