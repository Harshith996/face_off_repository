import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:image_picker/image_picker.dart';

class takePic extends StatefulWidget {
  const takePic({super.key});

  @override
  State<takePic> createState() => _takePicState();
}

class _takePicState extends State<takePic> {

  late File _image;

  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_null_comparison
      body: Center(
        child:_image == null ? const Text("No image selected") : Image.file(_image)
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          backgroundColor: Colors.blue,
          child: Icon(Icons.camera_alt),
          ),
        );
  }
}