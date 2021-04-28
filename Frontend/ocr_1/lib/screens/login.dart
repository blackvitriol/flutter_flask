import 'package:flutter/material.dart';
import '../utilities/styles.dart';
import '../components/drawer.dart';
import '../components/title_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(),
      backgroundColor: Colors.blue.shade300,
      body: Row(
      children: [
        AppDrawer(),
        Container(child:
          Center(child: Column(
        children: [
          Text("Login Page", style: heading2,)
        ],
      ),)
        ),
      ]
    )      
    );
  }
}


class FullScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Big screen web app")),
    body: Row(
      children: [
        Drawer(/* Menu items here */),
        Placeholder(/* Normal body here */),
      ]
    )
  );
} 