import 'package:artist_community_user/pages/notifation_page.dart';
import 'package:artist_community_user/pages/settings_page.dart';
import 'package:artist_community_user/pages/user_profile.dart';
import 'package:artist_community_user/pages/share_and_earn_page.dart';
import 'package:artist_community_user/pages/help_and_support_page.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
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
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/vino.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Vino V',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'Poppins'
                    ),
                  ),
                  Text(
                    'vinoviji676@gmail.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins'
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
              // Handle tap on Home
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
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  HelpAndSupportPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share,color: Colors.black),
            title: const Text('Share & Earn'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ShareAndEarnPage()));
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
