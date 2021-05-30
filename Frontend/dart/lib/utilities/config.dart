import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:dart_ipify/dart_ipify.dart';

// library globals;
// var backend_url = "localhost:5000";
var backend_url = "http://127.0.0.1:5000";

class deviceDetails {
  String deviceName ='';
  String deviceVersion ='';
  String identifier= '';
  String ip_address = '';

  Future<String>_getIP() async{
    final ipv4 = await Ipify.ipv4();
    ip_address = ipv4.toString();
  }

  Future<void>_deviceDetails() async{
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
          deviceName = build.model;
          deviceVersion = build.version.toString();
          identifier = build.androidId;
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
          deviceName = data.name;
          deviceVersion = data.systemVersion;
          identifier = data.identifierForVendor;
      }
        else if (webBrowserInfo!= null) {
          deviceName = webBrowserInfo.vendor;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

  }
}
