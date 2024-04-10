import 'package:artist_community_user/Services/globals.dart';
import 'package:artist_community_user/pages/first_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmailRecover extends StatefulWidget {
  const EmailRecover({super.key});

  @override
  State<EmailRecover> createState() => _EmailRecoverState();
}

class _EmailRecoverState extends State<EmailRecover> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add GlobalKey
  bool _isSending = false; // Add a flag to track if sending reset code

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  Future<void> sendResetCode() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with sending reset code
      setState(() {
        _isSending = true;
      });
      final String email = _emailController.text.trim();
      final response = await http.post(
        Uri.parse('$baseURL/send-reset-code'),
        body: {'email': email},
        headers: {'Accept': 'application/json'},
      );
      setState(() {
        _isSending = false;
      });
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                VerifyResetCodeScreen(email),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('An error occurred'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black54,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Recover Account",
          style: TextStyle(
              fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // Wrap with Form widget
          key: _formKey, // Assign GlobalKey to Form
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: '  Artispic Email Address',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                ),
                validator: _validateEmail, // Add validator
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 340,
                child: Stack(
                  // Use Stack to overlay CircularProgressIndicator
                  children: [
                    SizedBox(
                      height: 50,
                      width: 340,
                      child: ElevatedButton(
                        onPressed: _isSending ? null : sendResetCode,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF6495ED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: const Text('Next'),
                      ),
                    ),
                    if (_isSending)
                      const Center(
                        child:
                            CircularProgressIndicator(), // Show CircularProgressIndicator if sending reset code
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyResetCodeScreen extends StatefulWidget {
  final String email;

  const VerifyResetCodeScreen(this.email, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerifyResetCodeScreenState createState() => _VerifyResetCodeScreenState();
}

class _VerifyResetCodeScreenState extends State<VerifyResetCodeScreen> {
  final TextEditingController _resetCodeController = TextEditingController();

  Future<void> verifyResetCode() async {
    final String resetCode = _resetCodeController.text.trim();

    if (resetCode.isEmpty) {
      // Handle empty reset code
      return;
    }

    final response = await http.post(
      Uri.parse('$baseURL/verify-reset-code'),
      body: {
        'email': widget.email,
        'reset_code': resetCode,
      },
    );

    if (response.statusCode == 200) {

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResetPasswordScreen(widget.email)),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('An error occurred'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Verify Reset Code',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Email: ${widget.email}'),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _resetCodeController,
              decoration: const InputDecoration(labelText: 'Enter Reset Code'),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(
                onPressed: () {
                  verifyResetCode();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF6495ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('Verify'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen(this.email, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: const Text('Password reset successfully!'),
        duration: const Duration(seconds: 5), // Adjust the duration as needed
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FirstPage()));
            // You can also use Navigator.pop(context) to pop the ResetPasswordScreen if needed.
          },
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      // Handle empty fields
      return;
    }

    if (password != confirmPassword) {
      return;
    }

    final response = await http.post(
      Uri.parse('$baseURL/reset-password'),
      body: {
        'email': widget.email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Password reset success'),
        ),
      );
      // ignore: use_build_context_synchronously
      showSuccessSnackbar(context);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('An error occurred'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Reset Password',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Email: ${widget.email}'),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'New Password'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(
                onPressed: () {
                  resetPassword();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF6495ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('Reset Password'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
