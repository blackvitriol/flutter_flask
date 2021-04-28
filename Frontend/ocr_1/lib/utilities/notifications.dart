import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';


simple_toast(context, message){
  Toast.show(message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}
