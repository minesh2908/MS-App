part of 'chat_message_bloc.dart';

@immutable
sealed class ChatMessageState {}

final class ChatMessageInitial extends ChatMessageState {}

final class ChatMessageLoadingState extends ChatMessageInitial {}

final class ChatMessageSuccessState extends ChatMessageInitial {
  final List<ChatMessageRequestModel> message;

  ChatMessageSuccessState({required this.message});
}

final class ChatMessageErrorState extends ChatMessageInitial {
  final String message;

  ChatMessageErrorState({required this.message});
}
