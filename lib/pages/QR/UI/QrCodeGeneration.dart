import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({super.key});

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  final TextEditingController linkTextEditingController =
      TextEditingController();
  String data = 'https://www.linkedin.com/in/minesh-sarawogi-4787401a1/';
  XFile? selectedImage;
  Color selectedColor = Colors.black; 
  Future getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    selectedImage = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'QR',
          style: TextStyle(
              fontSize: 32,
              fontFamily: 'Goldman',
              color: Theme.of(context).colorScheme.scrim),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.scrim,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  controller: linkTextEditingController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: BorderSide(
                              width: 3,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer)),
                      hintText: 'Enter Link/Text for generating QR',
                      hintStyle: TextStyle(fontFamily: 'Goldman', fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80)))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectedImage == null
                      ? IconButton(
                          onPressed: () {
                            getImage();
                          },
                          icon: Icon(
                            Icons.add_photo_alternate,
                            size: 80,
                          ))
                      : Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: Image.file(
                                  File(selectedImage!.path),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    selectedImage = null;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.colorize,
                        size: 80,
                      )),
                ],
              ),
              InkWell(
                onTap: () {
                  data = linkTextEditingController.text;
                  setState(() {});
                  linkTextEditingController.clear();
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                      child: Text(
                    'Generate',
                    style: TextStyle(fontSize: 25, fontFamily: 'Goldman'),
                  )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              QrImageView(
                data: data,
                version: QrVersions.auto,
                size: 300.0,
                gapless: true,
                eyeStyle: QrEyeStyle(
                    color: selectedColor, eyeShape: QrEyeShape.square),
                dataModuleStyle: QrDataModuleStyle(
                    color: selectedColor,
                    dataModuleShape: QrDataModuleShape.square),
                embeddedImage: selectedImage != null
                    ? FileImage(File(selectedImage!.path))
                    : null,
                embeddedImageStyle: QrEmbeddedImageStyle(size: Size(40, 40)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                    child: Text(
                  'Download QR',
                  style: TextStyle(fontSize: 25, fontFamily: 'Goldman'),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
