import 'package:artist_community_user/components/app_drawer.dart';
import 'package:artist_community_user/pages/body.dart';
import 'package:flutter/material.dart';

class HomeWidgetScreen extends StatelessWidget {
  const HomeWidgetScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(), // Use AppDrawer as the drawer
      body: Body(),
    );
  }
}
