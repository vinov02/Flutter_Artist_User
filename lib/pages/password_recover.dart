import 'package:artist_community_user/pages/email_recover.dart';
import 'package:artist_community_user/pages/sms_recover.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PasswordRecover extends StatelessWidget {
  const PasswordRecover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black54,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text("               Recover Account",style: TextStyle(fontSize: 16,color: Colors.black54,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,

      ),
      body:  Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
             const Text('Choose a method to recover your account',style: TextStyle(color: Colors.grey,fontSize: 16),),
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 340,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const SmsRecover(),
                  ),);
                },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black54, backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                child: const Text("SMS")
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 340,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const EmailRecover(),
                  ),);
                },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color(0xFF6495ED),
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),

                      ),
                    ),
                    child: const Text("Email"),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
