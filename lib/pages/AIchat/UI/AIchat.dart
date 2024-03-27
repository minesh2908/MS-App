import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app/pages/AIchat/bloc/chat_message_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/model/chat-message-request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();
  final ChatMessageBloc chatMessageBloc = ChatMessageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatMessageBloc, ChatMessageState>(
          bloc: chatMessageBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case ChatMessageSuccessState:
                List<ChatMessageRequestModel> message =
                    (state as ChatMessageSuccessState).message;

                return Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary),
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
                                'AI Chat',
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
                        child: message.length == 0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 200,
                                      width: 200,
                                      child: LottieBuilder.asset(
                                          'assets/waving.json')),
                                  AnimatedTextKit(
                                    totalRepeatCount: 20,
                                    animatedTexts: [
                                      TyperAnimatedText('Hello Bro, ',
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Goldman',
                                              fontWeight: FontWeight.bold)),
                                      TyperAnimatedText(
                                          'Lets start the Conversation',
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Goldman',
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                    child: ListView.builder(
                                        itemCount: message.length,
                                        itemBuilder: (conext, index) {
                                          return Container(
                                            margin: EdgeInsets.all(10),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.yellow.shade300
                                                    .withOpacity(0.6),
                                                borderRadius: message[index]
                                                            .role ==
                                                        'user'
                                                    ? BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(25),
                                                        topRight:
                                                            Radius.circular(25),
                                                        bottomLeft:
                                                            Radius.circular(25))
                                                    : BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(25),
                                                        topRight:
                                                            Radius.circular(25),
                                                        bottomRight:
                                                            Radius.circular(
                                                                25))),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                message[index].role == 'user'
                                                    ? Text(
                                                        'User',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'NanumMyeongjo',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )
                                                    : Text(
                                                        'AI Chat',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'NanumMyeongjo',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                Text(
                                                  message[index]
                                                      .parts
                                                      .first
                                                      .text
                                                      .replaceAll('**', ''),
                                                  style: TextStyle(
                                                      height: 2,
                                                      fontSize: 16,
                                                      fontFamily: 'NanumMyeongjo',
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          );
                                        })),
                              ),
                      ),
                      Column(
                        children: [
                          chatMessageBloc.generating == true
                              ? Container(
                                  height: 50,
                                  child: Lottie.asset('assets/loading.json'))
                              : SizedBox()
                        ],
                      ),
                      Container(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: TextField(
                                    controller: textEditingController,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumMyeongjo'),
                                    decoration: InputDecoration(
                                        hintText: 'Start Chating...',
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontFamily: 'Goldman'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .scrim),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .scrim),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  if (textEditingController.text.isNotEmpty) {
                                    String text = textEditingController.text;
                                    textEditingController.clear();
                                    chatMessageBloc.add(ChatMessageCalledEvent(
                                        promptByUser: text));
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.scrim,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 28,
                                    child: Center(
                                      child: Icon(
                                        Icons.send,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              case ChatMessageErrorState:
                return Container(
                  child: Text('Some Error Occured'),
                );
              default:
                return SizedBox();
            }
          }),
    );
  }
}
