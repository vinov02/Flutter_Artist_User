import 'package:artist_community_user/Services/auth_services.dart';
import 'package:artist_community_user/pages/home_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  void createAccountPressed() async {

    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String mobile = _mobileController.text.trim();
    String confirmPassword = _confirmPassword.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      http.Response response =
      await AuthServices.register(name, email, password, mobile,confirmPassword);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        print('');
      } else {
        print('Request failed with status: ${response.body}');
      }
    } else {
      print('Email and password are required.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF6495ED),
                Color(0xff281537),
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 80.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30,),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          suffixIcon: Icon(Icons.check, color: Colors.grey),
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(Icons.check, color: Colors.grey),
                        ),
                      ),
                      TextField(
                        controller: _mobileController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile',
                          suffixIcon: Icon(Icons.check, color: Colors.grey),
                        ),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                      ),
                      TextField(
                        controller: _confirmPassword,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const SizedBox(height: 70,),
                      Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6495ED), Color(0xff281537)],
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: createAccountPressed,
                            child: const Text('SIGN IN',style: TextStyle(color: Colors.white,fontSize: 18),),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80,),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
