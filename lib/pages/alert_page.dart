import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

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
        title: const Text('Alerts',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAlertItem(
            icon: Icons.notifications_active,
            title: 'New Artworks',
            subtitle: 'Get notified about new artworks added to the gallery.',
          ),
          const SizedBox(height: 10.0),
          _buildAlertItem(
            icon: Icons.local_shipping,
            title: 'Order Updates',
            subtitle: 'Receive updates about the status of your orders.',
          ),
          const SizedBox(height: 10.0),
          _buildAlertItem(
            icon: Icons.favorite,
            title: 'Favorites',
            subtitle: 'Get alerts when your favorite artists add new artworks.',
          ),
          const SizedBox(height: 10.0),
          _buildAlertItem(
            icon: Icons.timer,
            title: 'Reminders',
            subtitle: 'Set reminders for upcoming art events and exhibitions.',
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: true, // Set the initial value of the switch
        onChanged: (value) {
          // Implement logic to handle switch state change
        },
      ),
    );
  }
}
