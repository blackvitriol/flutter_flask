import 'package:flutter/material.dart';
import '../components/drawer.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.transit_enterexit), onPressed:(){
            Navigator.pop(context);
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(onPressed: null)
          ],
        ),
      ),
      drawer: AppDrawer(),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
