import 'package:artist_community_user/pages/signup_page_2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black54,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text('                          1 of 4',style: TextStyle(
            color: Colors.black54,
            fontSize: 16,

        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 12,
                width: 90,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    topRight: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Text("What's your mobile and",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  color: Colors.black
                ),
              ),
              const Text("email?",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.black
                ),
              ),
              const SizedBox(height: 20,),
              const Text("This information is used for login, security, and \n account recovery purpose only. It will never be \n shown on your profile",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.grey
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Enter both or at least one of the following.",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.grey
                ),
              ),
              const SizedBox(height: 20,),
              //PhoneNumberInputWidget(),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter phone number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: const SignUpPageSecond(),
                    ),);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color(0xFF6495ED),
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child:  const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
