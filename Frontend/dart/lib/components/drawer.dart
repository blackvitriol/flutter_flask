import 'package:flutter/material.dart';
import '../utilities/styles.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: Colors.black,
            // gradient: LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //     colors: [Colors.blue, Colors.red])
          ),
          child: Stack(
            children: [
              Image.asset("resources/images/rose.gif"),
              Text(
                'UrduReader',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home Page'),
          enabled: true,
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    ));
    // ),
    // child: Stack(
    //   children: [
    //     Container(
    //         decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //               begin: Alignment.topRight,
    //               end: Alignment.bottomLeft,
    //               colors: [Colors.blue, Colors.red])),
    //     // height: SizeConfig.screenHeight*0.10,
    //   ),
    //   Align(alignment: Alignment.center, child: Image.asset("resources/images/rose.gif"))],
    // ),
    //   );
  }
}
