import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
import '../components/drawer.dart';

class AnalysisPage extends StatefulWidget {
  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inference"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'These are the results of your image',
            ),
            Image.asset("resources/images/apple.png"),
            Text("Data acquired: Apple")
          ],
        ),
      ),
      drawer: AppDrawer(),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
