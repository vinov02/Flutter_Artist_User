import 'package:artist_community_user/pages/user_profile.dart';
import 'package:artist_community_user/pages/wishlist_page.dart';
import 'package:artist_community_user/pages/message_screen.dart';
import 'package:artist_community_user/pages/home_wideget_screnn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int selectedIndex = 0;

  // List of widgets to display in the body
  final List<Widget> pages = [
    const HomeWidgetScreen(),
    WishList(),
    const MessageInbox(),
    const UserProfile(),

  ];

  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),

            child: const Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: const Color(0xFF363437),
        body: pages[selectedIndex], // Display the selected page
        bottomNavigationBar: Container(
          height: 93,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: GNav(
              gap: 8,
              color: Colors.black,
              activeColor: Colors.white,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  backgroundColor: Color(0xFF6078EA),
                ),
                GButton(
                  icon: Icons.card_travel_rounded,
                  text: 'Wishlist',
                  backgroundColor: Color(0xFFCC527A),
                ),
                GButton(
                  icon: Icons.messenger_outline,
                  text: 'Message',
                  backgroundColor: Colors.blueGrey,
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  backgroundColor: Color(0xFF6078EA),
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
