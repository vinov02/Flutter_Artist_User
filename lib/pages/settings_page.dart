import 'package:flutter/material.dart';
import 'package:artist_community_user/pages/edit_profile_page.dart';
import 'package:artist_community_user/pages/account_settings_page.dart';
import 'package:artist_community_user/pages/alert_page.dart';
import 'package:artist_community_user/pages/follows_page.dart';
import 'package:artist_community_user/pages/payment_page.dart';
import 'package:artist_community_user/pages/push_notifications_page.dart';
import 'package:artist_community_user/pages/send_feedback.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 15,),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black, // Specify the desired color here
        ),
        title: const Text('Account',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView(
        children:[
          _buildListTile('Edit Profile', Icons.arrow_forward_ios, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
          }),
          _buildListTile('Account Settings', Icons.arrow_forward_ios, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettingsPage()));
          }),
          _buildListTile('Alerts', Icons.arrow_forward_ios, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AlertPage()));
          }),
          _buildListTile('Follows', Icons.arrow_forward_ios, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowsPage()));
          }),
          _buildListTile('Order History', Icons.arrow_forward_ios, () {
            // Navigate to Account Settings page
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
          }),
          _buildListTile('Payment', Icons.arrow_forward_ios, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
          }),
          _buildListTile('Push Notifications', Icons.arrow_forward_ios, () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const PushNotificationsPage()));
          }),
          _buildListTile('Send Feedback', Icons.arrow_forward_ios, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SendFeedbackPage()));
          }),
          _buildListTile('Personal Data Request', Icons.arrow_forward_ios, () {
            // Navigate to Account Settings page
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
          }),
          _buildListTile('About', Icons.arrow_forward_ios, () {
            // Navigate to Account Settings page
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
          }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Log out logic
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, void Function()? onTap) {
    return ListTile(
      title: Text(title),
      trailing: Icon(icon),
      onTap: onTap,
    );
  }
}
