import 'dart:convert';
import 'package:artist_community_user/Services/auth_services.dart';
import 'package:artist_community_user/pages/email_recover.dart';
import 'package:artist_community_user/pages/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Enter Email and Password'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    http.Response response = await AuthServices.login(email, password);
    var responseBody = jsonDecode(response.body);

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      final authToken = responseBody['token'];
      await saveToken(authToken); // Save the token
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(responseBody['message']),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      var errorMessage = responseBody['error'] ?? 'An error occurred';
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
        ),
      );
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black54,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Log In',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                hintText: '  Email or mobile',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                hintText: '  Password',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 340.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF6495ED),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator() // Show CircularProgressIndicator if loading
                    : const Text('Log In'),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Forgot details? - ', style: TextStyle(color: Colors.black)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const EmailRecover(),
                      ),
                    );
                  },
                  child: const Text('Recover Account', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
