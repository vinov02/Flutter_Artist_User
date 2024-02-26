import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
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
        title: const Text('Account settings',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          _buildListItem(
            icon: Icons.email,
            title: 'Email',
            onTap: () {
              // Navigate to Email settings page
            },
          ),
          _buildListItem(
            icon: Icons.phone,
            title: 'Phone',
            onTap: () {
              // Navigate to Phone settings page
            },
          ),
          _buildListItem(
            icon: Icons.money,
            title: 'Price Range',
            onTap: () {
              // Navigate to Price Range settings page
            },
          ),
          _buildListItem(
            icon: Icons.facebook,
            title: 'Linked Accounts',
            onTap: () {
              // Navigate to Linked Accounts settings page
            },
          ),
          const SizedBox(height: 20.0), // Add spacing between list items
          _buildDeleteAccountItem(context),
        ],
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  Widget _buildDeleteAccountItem(BuildContext context) {
    return InkWell(
      onTap: () {
        // Show confirmation dialog to delete account
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Account'),
              content: const Text('Are you sure you want to delete your account?'),
              actions: [
                TextButton(
                  onPressed: () {
                    // Implement delete account functionality
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
      },
      child: const ListTile(
        leading:  Icon(Icons.delete),
        title:  Text('Delete My Account'),
        trailing:  Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
