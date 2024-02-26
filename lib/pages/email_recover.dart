import 'package:flutter/material.dart';

class EmailRecover extends StatefulWidget {
  const EmailRecover({super.key});

  @override
  State<EmailRecover> createState() => _EmailRecoverState();
}

class _EmailRecoverState extends State<EmailRecover> {
  final TextEditingController _emailController = TextEditingController();

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
          "               Recover Account",
          style: TextStyle(
              fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey,fontSize: 14),
                hintText: '  Artispic Email Address',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(onPressed: (){
              },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFF6495ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                  child: const Text('Next'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
