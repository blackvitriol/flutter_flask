import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../utilities/backend_api.dart';
import 'package:bot_toast/bot_toast.dart';

AppBar AppTitleBar(){
    return AppBar(
      automaticallyImplyLeading: false,
        title: Text("Data Processing Engine"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.accessibility), onPressed: (){
            BotToast.showText(text: "Checking Server Status..");
            BackendFunctions().check_server();
            // navigatorKey.currentState.pushNamed('/');
          })
        ],
      );
}
