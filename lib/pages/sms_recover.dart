import 'package:flutter/material.dart';

class SmsRecover extends StatelessWidget {
  const SmsRecover({super.key});

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
