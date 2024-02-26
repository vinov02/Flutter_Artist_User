import 'package:flutter/material.dart';

class FollowsPage extends StatelessWidget {
  const FollowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 15,),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black, // Specify the desired color here
          ),
        ),
        body: const Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Follows',style: TextStyle(
                    fontSize: 26
                ),
                ),
              ),
            ),
            DefaultTabController(length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Alerts',),
                      Tab(text: 'Shows',),
                      Tab(text: 'Categories',),
                    ],
                  ),
                  SizedBox(
                    height: 200, // This height can be adjusted as needed
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 100,),
                            Text("You haven't followed any artists yet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                            SizedBox(height: 20,),
                            Text("When you've found an artist you like,follow"),
                            Text('them to get updates on new works that'),
                            Text('become available.'),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 100,),
                            Text("You haven't saved any shows yet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                            SizedBox(height: 20,),
                            Text('When you save shows, they will show up'),
                            Text("here for future use."),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 100,),
                            Text("You're not following any categories yet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                            SizedBox(height: 20,),
                            Text('Find a few categories to help improve your'),
                            Text("artwork recommendations."),
                          ],
                        ),
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
