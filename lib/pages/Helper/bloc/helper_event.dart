// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'helper_bloc.dart';

@immutable
sealed class HelperEvent {}
class HelperGenerateEvent extends HelperEvent {
  String helperText;
  HelperGenerateEvent({
    required this.helperText,
  });
  
}
