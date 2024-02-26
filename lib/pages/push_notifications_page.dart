import 'package:flutter/material.dart';

class PushNotificationsPage extends StatelessWidget {
  const PushNotificationsPage({Key? key}) : super(key: key);

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
        title: const Text('Push Notifications', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Enable Push Notifications'),
            trailing: Switch(
              activeColor: Colors.blueGrey,
              value: true, // Set your value based on user's preference
              onChanged: (value) {
                // Implement logic to enable/disable push notifications
              },
            ),
          ),
          ListTile(
            title: const Text('Notification Sound'),
            trailing: DropdownButton<String>(
              value: 'Default', // Set your value based on user's preference
              onChanged: (newValue) {
                // Implement logic to change notification sound
              },
              items: <String>['Default', 'Sound 1', 'Sound 2', 'Sound 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text('Vibrate on Notification'),
            trailing: Switch(
              activeColor: Colors.blueGrey,
              value: true, // Set your value based on user's preference
              onChanged: (value) {
                // Implement logic to enable/disable vibration
              },
            ),
          ),
          ListTile(
            title: const Text('Notification Frequency'),
            trailing: DropdownButton<int>(
              value: 1, // Set your value based on user's preference
              onChanged: (newValue) {
                // Implement logic to change notification frequency
              },
              items: <int>[1, 2, 3, 4, 5]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
