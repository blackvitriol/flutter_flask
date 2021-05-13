import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
import 'settings.dart';
import 'package:image_picker/image_picker.dart';
import '../utilities/config.dart';
import '../utilities/styles.dart';
import '../components/drawer.dart';
import '../components/bottom_nav.dart';
import 'package:path/path.dart';
import '../components/title_bar.dart';
import 'package:dio/dio.dart';
import 'package:bot_toast/bot_toast.dart';
// import '../../utilities/styles.dart';
// import '../../utilities/notifications.dart';
// import '../../utilities/backend_api.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _image;
  final picker = ImagePicker();
  Response response;
  var dio = Dio();

  chooseFileUsingImagePicker() async {
    // read file as bytes
    var selected_image = await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.readAsBytes());
    setState(() {
      _image = selected_image;
    });
  }

  Future uploadSelectedFile(page_controller) async {
    var api_addr = backend_url + "/urdu_ocr";
    try {
      print("Trying to upload image to " + api_addr);
      String base64Image = base64Encode(_image);
      response = await dio
          .post(api_addr, data: {'type': 'ocr_request', 'image': base64Image});
      page_controller.nextPage(
          duration: Duration(seconds: 1), curve: Curves.easeIn);
      BotToast.showText(text: response.data['status'].toString());
    } catch (e) {
      BotToast.showText(text: "Failed to connect to server");
      // BotToast.showText(text: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final page_controller = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppTitleBar(),
      // Page Body
      body: PageView(
          scrollDirection: Axis.horizontal,
          controller: page_controller,
          children: [
            // PAGES ==============================================
            // Page Body: Page 1 - extract later ?? ffs
            page1(page_controller),
            // Page Body: Page 2
            page2(),
          ]),
      // PAGES ==============================================
      // bottomNavigationBar: bottomNav(),
      drawer: AppDrawer(),
    );
  }

// Contents of Pages
  Container page1(PageController page_controller) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 7),
                      spreadRadius: 1)
                ],
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome to the DPE App !', style: heading3),
                Text('DPE currently works on images only.', style: heading5),
                Text('Click the buttons below:', style: heading4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: Colors.green,
                        child: Text("Select Image"),
                        onPressed: () => chooseFileUsingImagePicker()),
                    // MaterialButton(color: Colors.blue, child: Text("Select File"), onPressed: ()=> chooseFileUsingFilePicker()),
                  ],
                ),
                MaterialButton(
                    color: Colors.grey,
                    child: Text("Perform Actions"),
                    onPressed: () {
                      uploadSelectedFile(page_controller);
                    }),
                SizedBox(height: 30),
                // Text(fileDescription, style: heading4),
                Container(
                    height: SizeConfig.screenHeight * 0.3,
                    width: SizeConfig.screenWidth * 0.3,
                    child: _image == null
                        ? Center(child: Text('No image selected.'))
                        : Image.memory(_image)),
              ],
            )));
  }

  Container page2() {
    return Container(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.red],
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is the second page', style: heading4),
              Text('What are you doing here ? Go back to the first page !',
                  style: heading5),
            ],
          ),
        ));
  }
}
