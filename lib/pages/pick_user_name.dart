import 'package:flutter/material.dart';

class PickUserName extends StatelessWidget {
  const PickUserName({super.key});

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
          title: const Text('                          4 of 4',style: TextStyle(
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
                width: 390,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Text("Pick a user name and ",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.black
                ),
              ),
              const Text("password.",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.black
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Last step your almost there!",
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
                  labelText: 'Enter username',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter password',
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
