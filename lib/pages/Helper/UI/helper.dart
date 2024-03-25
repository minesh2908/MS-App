import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app/model/helper.dart';
import 'package:space_app/pages/Helper/bloc/helper_bloc.dart';
import 'package:space_app/repo/helper-api.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:space_app/responsive/responsive_layout.dart';

class Helper extends StatefulWidget {
  const Helper({super.key});

  @override
  State<Helper> createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  final TextEditingController textEditingController = TextEditingController();
  final HelperBloc helperBloc = HelperBloc();
  String helperResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: BlocConsumer<HelperBloc, HelperState>(
        bloc: helperBloc,
        listener: (context, state) {
          if (state is HelperSuccessState) {
            helperResult = state.helperResult;
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HelperInitial:
              return ResponsiveLayout(
                mobileBody: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'HELPER',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'Goldman',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.black,
                                    size: 28,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 80,
                                child: AnimatedTextKit(
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        'Enter your problem or situation in which you are stuck, we will try to give solution for your problem. For Example : If you are having heavy pain in head just type Headache',
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Goldman',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: textEditingController,
                                      style: TextStyle(fontFamily: 'Goldman'),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic),
                                        hintText: 'Enter Your Problem',
                                        fillColor: Colors.grey.shade600,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      helperBloc.add(HelperGenerateEvent(
                                          helperText:
                                              "Can you tell me some best practices for dealing with ${textEditingController.text}. Please give me a elaborated answer in points answer which covers everything about the topic, I need answer in HTML code without title tag and please do not add ```html in the output"));
                                      textEditingController.clear();
                                    },
                                    child: CircleAvatar(
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.search,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      radius: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                tabletBody: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'HELPER',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'Goldman',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.black,
                                    size: 28,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 80,
                                child: AnimatedTextKit(
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        'Enter your problem or situation in which you are stuck, we will try to give solution for your problem. For Example : If you are having heavy pain in head just type Headache',
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Goldman',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: textEditingController,
                                      style: TextStyle(fontFamily: 'Goldman'),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic),
                                        hintText: 'Enter Your Problem',
                                        fillColor: Colors.grey.shade600,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      helperBloc.add(HelperGenerateEvent(
                                          helperText:
                                              "Can you tell me some best practices for dealing with ${textEditingController.text}. Please give me a elaborated answer in points answer which covers everything about the topic, I need answer in HTML code without title tag and please do not add ```html in the output"));
                                      textEditingController.clear();
                                    },
                                    child: CircleAvatar(
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.search,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      radius: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                desktopBody: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'HELPER',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'Goldman',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.black,
                                    size: 28,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: AnimatedTextKit(
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'Enter your problem or situation in which you are stuck, we will try to give solution for your problem. For Example : If you are having heavy pain in head just type Headache',
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Goldman',
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: textEditingController,
                                      style: TextStyle(fontFamily: 'Goldman'),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic),
                                        hintText: 'Enter Your Problem',
                                        fillColor: Colors.grey.shade600,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      helperBloc.add(HelperGenerateEvent(
                                          helperText:
                                              "Can you tell me some best practices for dealing with ${textEditingController.text}. I need to write this in 2 pages so please give me a elaborated answer in multiple points which covers everything about the topic, I need answer in HTML code without title tag and please do not add ```html in the output"));
                                      textEditingController.clear();
                                    },
                                    child: CircleAvatar(
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.search,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      radius: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case HelperSuccessState:
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HELPER',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.black,
                                      size: 28,
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () {
                                      helperBloc.add(HelperPopEvent());
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.black,
                                      size: 28,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HtmlWidget(helperResult),
                        ),
                      ),
                    )
                  ],
                ),
              );
            case HelperLoadingState:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Lottie.asset('assets/waving.json'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: AnimatedTextKit(animatedTexts: [
                      RotateAnimatedText('Searching Best Solutions',
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Goldman',
                              fontWeight: FontWeight.bold)),
                      RotateAnimatedText('You can sit and relax',
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Goldman',
                              fontWeight: FontWeight.bold)),
                      RotateAnimatedText('We will definatley give you solution',
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Goldman',
                              fontWeight: FontWeight.bold))
                    ]),
                  ),
                ],
              );
            default:
              return SizedBox();
          }
        },
      ),
    ));
  }
}
