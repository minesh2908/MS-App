import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app/pages/Helper/bloc/helper_bloc.dart';
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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
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
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'HELPER',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'Goldman',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 53, 52, 52),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.home,
                                    color: Color.fromARGB(255, 53, 52, 52),
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: const [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: Offset(10, 15),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Image.asset(
                                        'assets/helper.png',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 50,
                                    ),
                                    child: SizedBox(
                                      height: 100,
                                      child: AnimatedTextKit(
                                        totalRepeatCount: 1,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                            'Stuck? Share your situation, we will offer solutions. Example: Headache for head pain.',
                                            textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                79,
                                                78,
                                                78,
                                              ),
                                              fontSize: 18,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 14,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Material(
                                            elevation: 20,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            shadowColor: Colors.black,
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              controller: textEditingController,
                                              style: const TextStyle(
                                                fontFamily: 'NanumMyeongjo',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                hintStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                    255,
                                                    105,
                                                    103,
                                                    103,
                                                  ),
                                                  fontSize: 20,
                                                ),
                                                hintText:
                                                    'Enter Your Situation...',
                                                // fillColor: Colors.white,
                                                fillColor: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print(textEditingController.text);
                                            textEditingController.text.isEmpty
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Enter your problem first before searching',
                                                      ),
                                                    ),
                                                  )
                                                : helperBloc.add(
                                                    HelperGenerateEvent(
                                                      helperText:
                                                          'Can you tell me some best practices for dealing with ${textEditingController.text}. I need to write this in 1000 words so please give me a elaborated answer in multiple points which covers everything about the topic, I need answer only in HTML code without title tag and please do not add ```html in the output',
                                                    ),
                                                  );
                                            textEditingController.clear();
                                          },
                                          child: Material(
                                            elevation: 20,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: CircleAvatar(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary,
                                              radius: 32,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                child: const Icon(
                                                  Icons.search,
                                                  size: 30,
                                                  color: Color.fromARGB(
                                                    255,
                                                    105,
                                                    103,
                                                    103,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  tabletBody: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'HELPER',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'Goldman',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 53, 52, 52),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.home,
                                    color: Color.fromARGB(255, 53, 52, 52),
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: const [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: Offset(10, 15),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Image.asset(
                                        'assets/helper.png',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 50,
                                    ),
                                    child: SizedBox(
                                      height: 50,
                                      child: AnimatedTextKit(
                                        totalRepeatCount: 1,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                            'Stuck? Share your situation, we will offer solutions. Example: Headache for head pain.',
                                            textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                79,
                                                78,
                                                78,
                                              ),
                                              fontSize: 18,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 14,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Material(
                                            elevation: 20,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            shadowColor: Colors.black,
                                            child: TextFormField(
                                              cursorColor: Colors.grey,
                                              controller: textEditingController,
                                              style: const TextStyle(
                                                fontFamily: 'NanumMyeongjo',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                hintStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                    255,
                                                    105,
                                                    103,
                                                    103,
                                                  ),
                                                  fontSize: 20,
                                                ),
                                                hintText:
                                                    'Enter Your Situation...',
                                                // fillColor: Colors.white,
                                                fillColor: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print(textEditingController.text);
                                            textEditingController.text.isEmpty
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Enter your problem first before searching',
                                                      ),
                                                    ),
                                                  )
                                                : helperBloc.add(
                                                    HelperGenerateEvent(
                                                      helperText:
                                                          'Can you tell me some best practices for dealing with ${textEditingController.text}. I need to write this in 1000 words so please give me a elaborated answer in multiple points which covers everything about the topic, I need answer only in HTML code without title tag and please do not add ```html in the output',
                                                    ),
                                                  );
                                            textEditingController.clear();
                                          },
                                          child: Material(
                                            elevation: 20,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: CircleAvatar(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary,
                                              radius: 32,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                child: const Icon(
                                                  Icons.search,
                                                  size: 30,
                                                  color: Color.fromARGB(
                                                    255,
                                                    105,
                                                    103,
                                                    103,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  desktopBody: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'HELPER',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'Goldman',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 53, 52, 52),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.home,
                                    color: Color.fromARGB(255, 53, 52, 52),
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: const [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: Offset(10, 15),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Image.asset(
                                        'assets/helper.png',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 40,
                                    ),
                                    child: SizedBox(
                                      height: 50,
                                      child: AnimatedTextKit(
                                        totalRepeatCount: 1,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                            'Stuck? Share your situation, we will offer solutions. Example: Headache for head pain.',
                                            textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                79,
                                                78,
                                                78,
                                              ),
                                              fontSize: 18,
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 14,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Material(
                                            elevation: 20,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            shadowColor: Colors.black,
                                            child: TextFormField(
                                              controller: textEditingController,
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                fontFamily: 'NanumMyeongjo',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                hintStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                    255,
                                                    105,
                                                    103,
                                                    103,
                                                  ),
                                                  fontSize: 20,
                                                ),
                                                hintText:
                                                    'Enter Your Situation...',
                                                // fillColor: Colors.white,
                                                fillColor: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print(textEditingController.text);
                                            textEditingController.text.isEmpty
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Enter your problem first before searching',
                                                      ),
                                                    ),
                                                  )
                                                : helperBloc.add(
                                                    HelperGenerateEvent(
                                                      helperText:
                                                          'Can you tell me some best practices for dealing with ${textEditingController.text}. I need to write this in 1000 words so please give me a elaborated answer in multiple points which covers everything about the topic, I need stricty in HTML code everytime without title tag and please do not add ```html in the output',
                                                    ),
                                                  );
                                            textEditingController.clear();
                                          },
                                          child: Material(
                                            elevation: 20,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: CircleAvatar(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary,
                                              radius: 32,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                child: const Icon(
                                                  Icons.search,
                                                  size: 30,
                                                  color: Color.fromARGB(
                                                    255,
                                                    105,
                                                    103,
                                                    103,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              case HelperSuccessState:
                return SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'HELPER',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'Goldman',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.home,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      helperBloc.add(HelperPopEvent());
                                    },
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: HtmlWidget(
                              helperResult,
                              textStyle: const TextStyle(
                                fontFamily: 'NanumMyeongjo',
                                fontSize: 18,
                                fontVariations: [],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              case HelperLoadingState:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Lottie.asset('assets/waving.json'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText(
                            'Searching Best Solutions',
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Goldman',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RotateAnimatedText(
                            'You can sit and relax',
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Goldman',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RotateAnimatedText(
                            'We will definatley give you solution',
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Goldman',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
