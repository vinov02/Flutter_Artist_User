import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool verifyId = false;
  bool verifyEmail = false;

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
        title: const Text('Edit Profile',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImagePicker(),
              const SizedBox(height: 16),
              _buildTextField('Full Name'),
              const SizedBox(height: 16),
              _buildTextField('Location'),
              const SizedBox(height: 16),
              _buildTextField('Profession'),
              const SizedBox(height: 16),
              _buildTextField('About'),
              const SizedBox(height: 16),
              _buildCheckbox('Verify Your ID', verifyId, (bool? value) {
                setState(() {
                  verifyId = value ?? false;
                });
              }),
              const SizedBox(height: 8),
              _buildCheckbox('Verify Your Email', verifyEmail, (bool? value) {
                setState(() {
                  verifyEmail = value ?? false;
                });
              }),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Save button logic
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    // Replace this with your image picker widget
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/vino.jpg"),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              // Image picker logic
            },
            child: const Text('Change Image'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
