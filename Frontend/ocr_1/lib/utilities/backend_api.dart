import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import '../utilities/config.dart';
import 'package:dio/dio.dart';
import 'package:bot_toast/bot_toast.dart';

class BackendFunctions{

  void check_server() async {
  try {
    var response = await Dio().get(backend_url+"/ping");
    
    print(response);
    BotToast.showText(text:response.toString());
  } catch (e) {
    BotToast.showText(text:e.toString());
    print(e);
  }
}
}