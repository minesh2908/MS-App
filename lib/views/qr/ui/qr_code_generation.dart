import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:minesh_app/views/qr/bloc/qr_bloc.dart';
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
  XFile? mobileSelectedImage;
  Color selectedColor = Colors.black;
  final qrCodeRepaintBoundaryKey = GlobalKey();

  Future pickImageFromMobile() async {
    XFile? image;
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Somwthing went wrong! Please try agin.'),
        ),
      );
    }

    setState(() {
      mobileSelectedImage = image;
    });
  }

  PlatformFile? webSelectedImage;
  Future<void> pickImageFromWeb() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) {
        return;
      }
      setState(() {
        webSelectedImage = result.files.first;
      });
    } catch (e) {}
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
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text(
          'QR',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Goldman',
            color: Color.fromARGB(255, 53, 52, 52),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 53, 52, 52),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(100),
                  child: TextField(
                    cursorColor: Colors.black38,
                    controller: linkTextEditingController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NanumMyeongjo',
                    ),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 105, 103, 103),
                        fontSize: 20,
                      ),
                      hintText: 'Enter Text/Link here',
                      // fillColor: Colors.white,
                      fillColor: Theme.of(context).colorScheme.onTertiary,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Checking for Web Device
                    if (kIsWeb)
                      webSelectedImage == null
                          ? IconButton(
                              onPressed: pickImageFromWeb,
                              icon: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 49, 49, 49),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.add_photo_alternate,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  size: 100,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(5, 5),
                                  ),
                                ],
                                color: Theme.of(context).colorScheme.onTertiary,
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Image.memory(
                                        Uint8List.fromList(
                                          webSelectedImage!.bytes!,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      webSelectedImage = null;
                                      setState(() {});
                                    },
                                    icon: Container(
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    else
                      mobileSelectedImage == null
                          ? IconButton(
                              onPressed: pickImageFromMobile,
                              icon: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 49, 49, 49),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.add_photo_alternate,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  size: 100,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(5, 5),
                                  ),
                                ],
                                color: Theme.of(context).colorScheme.onTertiary,
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Image.file(
                                        File(mobileSelectedImage!.path),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      mobileSelectedImage = null;
                                      setState(() {});
                                    },
                                    icon: Container(
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
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
                                content: SizedBox(
                                  height: 600,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ColorPicker(
                                        pickerColor: selectedColor,
                                        onColorChanged: (chooseColor) {
                                          selectedColor = chooseColor;
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Select Color',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 49, 49, 49),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              ),
                            ],
                            color: Theme.of(context).colorScheme.onTertiary,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onTertiary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.colorize,
                            size: 100,
                            color: selectedColor == Colors.black
                                ? Theme.of(context).colorScheme.primaryContainer
                                : selectedColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    linkTextEditingController.text.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter text first to generate QR Code',
                              ),
                            ),
                          )
                        : qrBloc.add(
                            GenerateQrEvent(
                              linkGenerationText:
                                  linkTextEditingController.text,
                              selectedColor: selectedColor,
                              mobileSelectedImage: mobileSelectedImage,
                              webSelectedImage: webSelectedImage,
                            ),
                          );

                    linkTextEditingController.clear();
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiary,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Generate',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Goldman',
                          color: Color.fromARGB(255, 105, 103, 103),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocBuilder<QrBloc, QrState>(
                  bloc: qrBloc,
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case QrInitial:
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 49, 49, 49),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              ),
                            ],
                            color: Theme.of(context).colorScheme.onTertiary,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onTertiary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: QrImageView(
                              data:
                                  'https://www.linkedin.com/in/minesh-sarawogi-4787401a1/',
                              size: 250,
                            ),
                          ),
                        );
                      case QrLoadingState:
                        return Column(
                          children: [
                            SizedBox(
                              height: 250,
                              width: 250,
                              child: LottieBuilder.asset('assets/scanner.json'),
                            ),
                            const Text(
                              'Generating Qr Code...',
                              style: TextStyle(
                                fontFamily: 'Goldman',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        );
                      case QrGenerationSuccessState:
                        state as QrGenerationSuccessState;
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 49, 49, 49),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              ),
                            ],
                            color: Theme.of(context).colorScheme.onTertiary,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onTertiary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: kIsWeb
                              ? Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: RepaintBoundary(
                                    key: qrCodeRepaintBoundaryKey,
                                    child: QrImageView(
                                      data: state.data,
                                      size: 250,
                                      eyeStyle: QrEyeStyle(
                                        color: state.color,
                                        eyeShape: QrEyeShape.square,
                                      ),
                                      dataModuleStyle: QrDataModuleStyle(
                                        color: state.color,
                                        dataModuleShape:
                                            QrDataModuleShape.square,
                                      ),
                                      embeddedImage: webSelectedImage != null
                                          ? MemoryImage(
                                              Uint8List.fromList(
                                                webSelectedImage!.bytes!,
                                              ),
                                            )
                                          : null,
                                      embeddedImageStyle:
                                          const QrEmbeddedImageStyle(
                                        size: Size(40, 40),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: RepaintBoundary(
                                    key: qrCodeRepaintBoundaryKey,
                                    child: QrImageView(
                                      data: state.data,
                                      size: 250,
                                      eyeStyle: QrEyeStyle(
                                        color: state.color,
                                        eyeShape: QrEyeShape.square,
                                      ),
                                      dataModuleStyle: QrDataModuleStyle(
                                        color: state.color,
                                        dataModuleShape:
                                            QrDataModuleShape.square,
                                      ),
                                      embeddedImage: state.mobileimage != null
                                          ? FileImage(
                                              File(state.mobileimage!.path),
                                            )
                                          : null,
                                      embeddedImageStyle:
                                          const QrEmbeddedImageStyle(
                                        size: Size(40, 40),
                                      ),
                                    ),
                                  ),
                                ),
                        );
                      case QrGenerationFailedState:
                        state as QrGenerationFailedState;
                        return Text(state.error);
                      default:
                        return const SizedBox();
                      // TODO: Handle this case.
                    }
                  },
                ),
                const SizedBox(
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
