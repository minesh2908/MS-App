import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:space_app/pages/QR/bloc/qr_bloc.dart';

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
  final qrCodeRepaintBoundaryKey = GlobalKey();
  Future getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = image;
    setState(() {});
  }

  // Future<void> downloadQR() async {
  //   if (await Permission.storage.isGranted) {
  //     print('Permission Granted');
  //     try {
  //       RenderRepaintBoundary boundary =
  //           qrCodeRepaintBoundaryKey.currentContext!.findRenderObject()
  //               as RenderRepaintBoundary;
  //       final image = await boundary.toImage();
  //       final byteData = await image.toByteData(format: ImageByteFormat.png);
  //       if (byteData != null) {
  //         final pngBytes = byteData.buffer.asUint8List();

  //         final directory = await getTemporaryDirectory();
  //         final file = File('${directory.path}/ms_qr_code.png');
  //         await file.writeAsBytes(pngBytes);

  //         // Show a success message or perform other actions
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: SnackBar(content: Text('QR code Downloaded'))));
  //         print('QR code downloaded successfully!');
  //       } else {
  //         print('I am working');
  //       }
  //     } on PlatformException catch (error) {
  //       print('Failed to download QR code: $error');
  //       // Handle platform-specific errors (e.g., permission denied)
  //     }
  //   } else {
  //     var status = await Permission.storage.request();
  //     if (status.isGranted) {
  //       // Permission granted, proceed with QR code download
  //       downloadQR();
  //     } else {
  //       // Permission denied by the user, inform the user
  //       print('Storage permission is required to download QR code');
  //       // Optionally, show a dialog or snackbar to inform the user
  //       // about the importance of the permission
  //     }
  //     print("Storage permission is not granted.");
  //   }
  // }
  final QrBloc qrBloc = QrBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'QR',
          style: TextStyle(
              fontSize: 32,
              fontFamily: 'Goldman',
              color: Color.fromARGB(255, 53, 52, 52)),
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
                color: Color.fromARGB(255, 53, 52, 52),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(100),
                  child: TextField(
                    cursorColor: Colors.black38,
                    controller: linkTextEditingController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NanumMyeongjo'),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 105, 103, 103),
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                      hintText: 'Enter Text/Link here',
                      // fillColor: Colors.white,
                      fillColor: Color.fromARGB(255, 208, 181, 234),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 208, 181, 234))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 208, 181, 234))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    selectedImage == null
                        ? IconButton(
                            onPressed: () {
                              getImage();
                            },
                            icon: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 49, 49, 49),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: Offset(5, 5))
                                  ],
                                  color: Color.fromARGB(255, 223, 180, 232),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 223, 180, 232),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.add_photo_alternate,
                                size: 100,
                              ),
                            ))
                        : Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 49, 49, 49),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(5, 5))
                                ],
                                color: Color.fromARGB(255, 223, 180, 232),
                                border: Border.all(
                                    color: Color.fromARGB(255, 223, 180, 232),
                                    width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                      File(selectedImage!.path),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      selectedImage = null;
                                      setState(() {});
                                    },
                                    icon: Container(
                                      child: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                    Container(
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      content: Container(
                                    height: 600,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ColorPicker(
                                            pickerColor: selectedColor,
                                            onColorChanged: (chooseColor) {
                                              selectedColor = chooseColor;
                                            }),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primaryContainer)),
                                            onPressed: () {
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Select Color',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))
                                      ],
                                    ),
                                  ));
                                });
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 49, 49, 49),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(5, 5))
                                ],
                                color: Color.fromARGB(255, 223, 180, 232),
                                border: Border.all(
                                    color: Color.fromARGB(255, 223, 180, 232),
                                    width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.colorize,
                              size: 100,
                              color: selectedColor == Colors.black
                                  ? null
                                  : selectedColor,
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    linkTextEditingController.text.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Please enter text first to generate QR Code')))
                        : qrBloc.add(GenerateQrEvent(
                            linkGenerationText: linkTextEditingController.text,
                            selectedColor: selectedColor,
                            selectedImage: selectedImage));

                    linkTextEditingController.clear();
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 208, 181, 234),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 10,
                          )
                        ]),
                    child: Center(
                        child: Text(
                      'Generate',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Goldman',
                          color: Color.fromARGB(255, 105, 103, 103)),
                    )),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                BlocBuilder<QrBloc, QrState>(
                  bloc: qrBloc,
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case QrInitial:
                        return QrImageView(
                          data:
                              'https://www.linkedin.com/in/minesh-sarawogi-4787401a1/',
                          version: QrVersions.auto,
                          size: 250.0,
                          gapless: true,
                          eyeStyle: QrEyeStyle(
                              color: Colors.black, eyeShape: QrEyeShape.square),
                          dataModuleStyle: QrDataModuleStyle(
                              color: Colors.black,
                              dataModuleShape: QrDataModuleShape.square),
                        );
                      case QrLoadingState:
                        return Column(
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              child: LottieBuilder.asset('assets/scanner.json'),
                            ),
                            Text('Generating Qr Code...',
                                style: TextStyle(
                                    fontFamily: 'Goldman', fontSize: 20))
                          ],
                        );
                      case QrGenerationSuccessState:
                        state as QrGenerationSuccessState;
                        return RepaintBoundary(
                          key: qrCodeRepaintBoundaryKey,
                          child: QrImageView(
                            data: state.data,
                            version: QrVersions.auto,
                            size: 250.0,
                            gapless: true,
                            eyeStyle: QrEyeStyle(
                                color: state.color,
                                eyeShape: QrEyeShape.square),
                            dataModuleStyle: QrDataModuleStyle(
                                color: state.color,
                                dataModuleShape: QrDataModuleShape.square),
                            embeddedImage: state.image != null
                                ? FileImage(File(state.image!.path))
                                : null,
                            embeddedImageStyle:
                                QrEmbeddedImageStyle(size: Size(40, 40)),
                          ),
                        );
                      case QrGenerationFailedState:
                        state as QrGenerationFailedState;
                        return Text(state.error);
                      default:
                        return SizedBox();
                      // TODO: Handle this case.
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                // InkWell(
                //   onTap: () async {
                //     await downloadQR();
                //   },
                //   child: Container(
                //     height: 60,
                //     width: 300,
                //     decoration: BoxDecoration(
                //         color: Theme.of(context).colorScheme.primaryContainer,
                //         borderRadius: BorderRadius.circular(40)),
                //     child: Center(
                //         child: Text(
                //       'Download QR',
                //       style: TextStyle(fontSize: 25, fontFamily: 'Goldman'),
                //     )),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
