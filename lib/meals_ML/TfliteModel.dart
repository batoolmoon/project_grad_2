import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {

  late File _image;
  late List _results;
  bool imageSelect = false;
  late String caloriesResult="";
  int qun=1;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  getSharedData()  async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
   prefs.setInt("calories", int.parse(caloriesResult)*qun);

   });

  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () {
                  _getImageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _getImageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // Use the picked image
      File imageFile = File(pickedImage.path);
      // Handle or display the image as required
      imageDetection(imageFile);
    }
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Use the picked image
      File imageFile = File(pickedImage.path);
      // Handle or display the image as required
      imageDetection(imageFile);
    }
  }


  Future imageDetection(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      print ("_results $_results");
      _image = image;
      imageSelect = true;

    });
    caloriesResult=_results[0]["label"].toString().substring(_results[0]["label"].toString().indexOf("-")+1,_results[0]["label"].toString().indexOf("c")-1);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient (
              begin: Alignment(1, 1),
              end: Alignment(-1.479, -1.615),
              colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
              stops: <double>[0, 1],
            ),
          ),
        ),
        centerTitle: true,
        title: const Text("Calories Classification"),
      ),
      body: ListView(
        children: [
          (imageSelect) ? Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Image.file(_image),
            ),
          ) : Container(
            margin: const EdgeInsets.all(10),
            child: const Opacity(
              opacity: 0.8,
              child: Center(
                child: Text("No image selected"),
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: (imageSelect) ? _results.map((result) {
                return Card(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "${result['label']}",
                      style: const TextStyle(color: Colors.red,
                          fontSize: 20),
                    ),
                  ),
                );
              }).toList() : [],

            ),
          ),

          imageSelect?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () { setState(() {qun++;}); }, child: Icon(Icons.add),),
              SizedBox(width: 10,),
              Text("$qun"),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: () { qun-1>=1?
              setState(() {qun--;}):null; }, child: Icon(Icons.minimize),),
            ],
          ):Container(),

          imageSelect?  Container(
            height: 40,
            margin: EdgeInsets.only(left: 80, right: 80,top: 20,bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent
              ),
              onPressed: () {
                print("caloriesResult ${int.parse(caloriesResult)*qun}" );
                print(caloriesResult);
                getSharedData();
              },
              child: Text('Save Calories Result'),
            ),
          ):Container(),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 80, right: 80),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent
              ),
              onPressed: () {
                _showImagePicker(context);
              },
              child: Text('Select an image'),
            ),
          ),
        ],
      ),
    );
  }
}





