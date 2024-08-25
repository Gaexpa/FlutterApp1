import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:developer' as devtools;

import 'package:intl/intl.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// variables
  File? selectedImage;
  var recognitions;
  String label = "";
  double confidence = 0.0;

  /// build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("亂度判斷"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.lightBlueAccent,
                  child: const Text("從圖片庫裡選取",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  onPressed: () {
                    _pickImageFromGallery();
                  }),
              MaterialButton(
                  color: Colors.redAccent,
                  child: const Text("從相機拍攝",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  onPressed: () {
                    _pickImageFromCamera();
                  }),
              const SizedBox(
                height: 20,
              ),

              /// 若照片不為null 則顯示照片；反之，顯示"請選取一張圖片"
              selectedImage != null
                  ? Image.file(
                selectedImage!,
                height: 520,
              )
                  : const Text("請選取一張圖片"),

              selectedImage != null
                  ? Text(
                "Label: $label\nConfidence:${confidence.toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
                  : Text(""),
            ],
          ),
        ),
      ),
    );
  }

  /// methods
  /// Picking an image from gallery
  Future _pickImageFromGallery() async {
    final XFile? returnedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    /// 顯示圖片
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });

    /// 亂度判斷
    recognitions = await Tflite.runModelOnImage(
        path: returnedImage.path,
        // required
        imageMean: 127.5,
        // defaults to 117.0
        imageStd: 127.5,
        // defaults to 1.0
        numResults: 2,
        // defaults to 5
        threshold: 0.1,
        // defaults to 0.1
        asynch: true // defaults to true
    );

    if (recognitions == null) {
      devtools.log("識別為null");
      return;
    }
    devtools.log(recognitions.toString());

    /// 顯示亂度
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  }

  /// Picking the image from camera
  Future _pickImageFromCamera() async {
    final XFile? returnedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    /// 顯示圖片
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });

    /// 亂度判斷
    recognitions = await Tflite.runModelOnImage(
        path: returnedImage.path,
        // required
        imageMean: 127.5,
        // defaults to 117.0
        imageStd: 127.5,
        // defaults to 1.0
        numResults: 2,
        // defaults to 5
        threshold: 0.1,
        // defaults to 0.1
        asynch: true // defaults to true
    );

    if (recognitions == null) {
      devtools.log("識別為null");
      return;
    }
    devtools.log(recognitions.toString());

    /// 顯示亂度
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  }

  /// 定義初始化載入的tflite model和label.txt...
  Future _tfLiteInit() async {
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant1.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        // defaults to 1
        isAsset: true,
        // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
        false // defaults to false, set to true to use GPU delegate
    );
  }

  /// 初始化State時，也初始化tflite model
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tfLiteInit();
  }

  /// 結束時關閉tflite model
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }
}
