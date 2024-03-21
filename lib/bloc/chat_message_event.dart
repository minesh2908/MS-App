// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_message_bloc.dart';

@immutable
sealed class ChatMessageEvent {}

class ChatMessageCalledEvent extends ChatMessageEvent {
  String promptByUser;
  ChatMessageCalledEvent({
    required this.promptByUser,
  });
}
