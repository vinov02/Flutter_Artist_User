import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        title: const Text('Notifications', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  const Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Activity',style: TextStyle(
                fontSize: 26
              ),
              ),
            ),
          ),
          DefaultTabController(length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.grey,
                  tabs: [
                    Tab(text: 'All',),
                    Tab(text: 'Alerts',)
                  ],
                ),
                SizedBox(
                  height: 200, // This height can be adjusted as needed
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 100,),
                          Text('Follow artists and galleries to stay up to date',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                          SizedBox(height: 20,),
                          Text('keep track of the art and events you love, and get'),
                          Text('recommendations based on who you follow.'),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 100,),
                          Text('Hunting for a particular artwork?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                          SizedBox(height: 20,),
                          Text('Create alerts on an artist or artwork page and get'),
                          Text("notifications here when there's a match."),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
