import 'package:flutter/material.dart';

class MessageInbox extends StatefulWidget {
  const MessageInbox({super.key});

  @override
  State<MessageInbox> createState() => _MessageInboxState();
}

class _MessageInboxState extends State<MessageInbox> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Inbox'),
      ),
      body:    Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children:[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Messages',style: TextStyle(
                      fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                ),
                const SizedBox(height: 40,),
                const Align(
                  alignment: Alignment.center,
                  child: Text('Keep track of your conversations with galleries. \n'
                      '          Contact galleries to learn more about \n'
                      '      works you want to collect. Use your inbox \n'
                      '               to stay on top of your inquiries.',
                  style: TextStyle(
                  fontSize: 16,
                  ),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27), // Adjust the value to change the amount of curvature
                    ),
                  ),
                onPressed: (){

                },
                 child: const Text('Explore works',style: TextStyle(
                   color: Colors.white,
                   fontSize: 18
                 ),),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
