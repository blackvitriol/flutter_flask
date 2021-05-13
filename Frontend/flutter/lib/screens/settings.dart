import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
import '../components/drawer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Settings Saved'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Dear user, your settings have been saved !'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

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
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(initialValue: "localhost",
                decoration: InputDecoration(
                  labelText: "Server Address",
                  hintText: "Enter server address",
                  border: OutlineInputBorder()),),
              Spacer(),
              ElevatedButton(onPressed:_showMyDialog, child: Text("Save Settings")),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
