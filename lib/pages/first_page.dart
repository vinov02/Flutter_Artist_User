import 'package:artist_community_user/pages/login_widget.dart';
import 'package:artist_community_user/pages/signup_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/back3.jpg"), fit: BoxFit.cover)),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 210,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "   artispic",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6495ED),
                          fontFamily: 'Poppins'),
                    )
                ),
                const SizedBox(
                  height: 13,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("     See the paintings right ",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontFamily: 'Poppins'))),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "     around you!",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'Poppins'),
                    )
                ),
                const SizedBox(height: 160),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const LoginWidget(),
                        ),);
                      },
                      style: ElevatedButton.styleFrom(

                        foregroundColor: Colors.white, backgroundColor: const Color(0xFF6495ED),
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: const Text('Log In',style: TextStyle(fontSize: 16),),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                const Align(
                  alignment: Alignment.center,
                  child: Text("Don't have an account?",style: TextStyle(fontSize: 13,fontFamily: 'Poppins'),),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const SignUpScreen(),
                        ),);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: const Text('Create a new account',style: TextStyle(fontSize: 16,color: Color(0xFF6495ED),)),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const Align(
                  alignment: Alignment.center,
                  child: Text('By creating an account, you agree to our Terms of',style: TextStyle(fontSize: 13,fontFamily: 'Poppins'),),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text('Service and Privacy Policy',style: TextStyle(fontSize: 13,fontFamily: 'Poppins'),),
                ),
              ],
            ),
          )
      ),
    );
  }
}
