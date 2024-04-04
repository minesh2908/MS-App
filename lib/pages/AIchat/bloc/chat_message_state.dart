part of 'chat_message_bloc.dart';

@immutable
sealed class ChatMessageState {}

final class ChatMessageInitial extends ChatMessageState {}

final class ChatMessageLoadingState extends ChatMessageInitial {}

final class ChatMessageSuccessState extends ChatMessageInitial {
  ChatMessageSuccessState({required this.message});
  final List<ChatMessageRequestModel> message;
}

final class ChatMessageErrorState extends ChatMessageInitial {
  ChatMessageErrorState({required this.message});
  final String message;
}
