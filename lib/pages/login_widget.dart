import 'dart:convert';

import 'package:artist_community_user/Services/auth_services.dart';
import 'package:artist_community_user/pages/home_widget.dart';
import 'package:artist_community_user/pages/password_recover.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:page_transition/page_transition.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login()async{
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {

      http.Response response =
      await AuthServices.login(email, password);
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseBody['message']),
            backgroundColor: Colors.green, // Set background color for success message
          ),
        );
      } else {
        var errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['error'];
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(errorMessage ?? 'An error occurred'),
          ),
        );
      }
    } else {
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text( 'Enter Email and Password'),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black54,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text('                          Log In',style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
      ),
      backgroundColor: Colors.white,
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
             TextField(
               controller: _emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
                hintText: '  Email or mobile',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
                hintText: '  Password',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 340.0,
              height: 50.0,
              child: ElevatedButton(
              onPressed: (){
                _login();
              },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFF6495ED),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              child:  const Text('Log In'),
              ),
            ),
            const SizedBox(height: 20,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Forgot details? - ',style: TextStyle(color: Colors.black),),
                TextButton(onPressed: (){
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const PasswordRecover(),
                  ),);
                }, child: const Text('Recover Account',style: TextStyle(color: Colors.black),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
