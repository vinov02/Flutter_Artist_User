import 'package:artist_community_user/pages/date_picker.dart';
import 'package:artist_community_user/pages/pick_user_name.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPageDate extends StatelessWidget {
  const SignUpPageDate({super.key});

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
          title: const Text('                          3 of 4',style: TextStyle(
              color: Colors.black54,
              fontSize: 16
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 12,
                width: 270,
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
              const Text("What's your date of",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.black
                ),
              ),
              const Text("birth?",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.black
                ),
              ),
              const SizedBox(height: 20,),
              const Text("This information is for account creation \npurpose only. Your age will never be shown on your \nprofile.",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.grey
                ),
              ),
              const SizedBox(height: 20,),
              DatePickerInputWidget(),
              const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: const PickUserName(),
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
        )
    );
  }
}
