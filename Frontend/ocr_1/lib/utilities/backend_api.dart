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

 uploadSelectedFile(objFile) async {
    //---Create http package multipart request object
    final request = http.MultipartRequest(
      "POST",
      Uri.parse(backend_url),
    );
    //-----add other fields if needed
    request.fields["id"] = "abc";

    //-----add selected file with request
    request.files.add(new http.MultipartFile(
        "Your parameter name on server side", objFile.readStream, objFile.size,
        filename: objFile.name));

    //-------Send request
    var resp = await request.send();

    //------Read response
    String result = await resp.stream.bytesToString();

    //-------Your response
    print(result);
  }

  // selectFile(objFile) async {
  // FilePickerResult result = await FilePicker.platform.pickFiles(
  //           type: FileType.custom,
  //           allowedExtensions: ['jpg', 'png'],
  //         );

  //   if(result != null) {
  //     PlatformFile file = result.files.first;
      
  //     print(file.name);
  //     // print(file.bytes);
  //     print(file.size);
  //     print(file.extension);
  //     print(file.path);

  //   } else {
  //     // User canceled the picker
  //   }
  //   return objFile;
  // }

  uploadFile() async {
    // simple_toast(context, "lol Salaam Hood 👦 !");
        // var postUri = Uri.parse(backend_url+"/im_size");
        // var request = new http.MultipartRequest("POST", postUri);
        // request.fields['user'] = 'blah';
        // // request.files.add(new http.MultipartFile.fromBytes('file', objFile.bytes, contentType: new MediaType('image', 'jpeg')))

        // request.send().then((response) {
        //   if (response.statusCode == 200) print("Uploaded!");
        // });
      }
}