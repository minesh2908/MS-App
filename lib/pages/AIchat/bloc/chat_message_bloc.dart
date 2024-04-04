import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:space_app/model/chat-message-request.dart';
import 'package:space_app/repo/chat-message-api.dart';

part 'chat_message_event.dart';
part 'chat_message_state.dart';

class ChatMessageBloc extends Bloc<ChatMessageEvent, ChatMessageState> {
  ChatMessageBloc() : super(ChatMessageSuccessState(message: const [])) {
    on<ChatMessageCalledEvent>(chatMessageCalledEvent);
  }
  List<ChatMessageRequestModel> message = [];
  bool generating = false;
  Future<FutureOr<void>> chatMessageCalledEvent(
      ChatMessageCalledEvent event, Emitter<ChatMessageState> emit) async {
    message.add(ChatMessageRequestModel(
        role: "user",
        parts: [ChatPartsMessageModel(text: event.promptByUser)]));
    emit(ChatMessageSuccessState(message: message));
    generating = true;
    try {
      String generatedText =
          await ChatMessageApiCall.chatTextGenerationApi(message);
      if (generatedText.isNotEmpty) {
        message.add(ChatMessageRequestModel(
            role: "model",
            parts: [ChatPartsMessageModel(text: generatedText)]));
        emit(ChatMessageSuccessState(message: message));
        generating = false;
      }
    } catch (e) {
      print(e.toString());
      emit(ChatMessageErrorState(message: e.toString()));
    }
  }
}
