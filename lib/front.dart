// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, prefer_const_constructors, annotate_overrides, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';
import 'input_page.dart';
import 'dart:async';
import 'package:hexcolor/hexcolor.dart';

class Front extends StatefulWidget {
  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  bool check() {
    String text1;
    text1 = nameController.text;
    if (text1 == "")
      // ignore: curly_braces_in_flow_control_structures
      return true;
    else
      // ignore: curly_braces_in_flow_control_structures
      return false;
  }

  File? image;
  TextEditingController nameController = new TextEditingController();
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Sorry!! Failed to pick your image $e");
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
          primary: HexColor('#2C2C2C'),
          onPrimary: Colors.yellow,
          textStyle: TextStyle(fontSize: 25),
        ),
        child: Row(
          children: [
            Icon(icon, size: 35),
            const SizedBox(width: 15),
            Text(title),
          ],
        ),
        onPressed: onClicked,
      );
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141414'),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("SizzleApp", style: TextStyle(color: Colors.yellow),),
          centerTitle: true,
          backgroundColor: HexColor('#111111'),
        ),

        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              Text(
                "Enter your name",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: nameController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: 'Name Required',
                  hintStyle: TextStyle(color: Colors.yellow),
                ),
              ),

              Spacer(),
              if(image==null) ...[
                new Container(
                        child: new Image.asset(
                          "assets/images/logo.jpg",
                          height: 180.0,
                          width: 300.0,
                        ),
                      )
              ]
              else ...[
                ClipOval(
                      child: Image.file(
                        image!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
              ],


              const SizedBox(height: 40),
              buildButton(
                title: "Pick your image",
              
                icon: Icons.image_outlined,
                onClicked: () => {
                  if (check() == true)
                    {
                      _showToast(context),
                    }
                  else
                    pickImage(ImageSource.gallery)
                },
              ),
              const SizedBox(height: 35),
              buildButton(
                title: "BMI CALCULATOR",
                icon: Icons.calculate,
                onClicked: () => {
                  if (check() == true)
                    {
                      _showToast(context),
                    }
                  else
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InputPage()))
                },
              ),
              Spacer(),
            ],
          ),
        ));
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Your Name Is Required to Calculate BMI"),
      ),
    );
  }
}
