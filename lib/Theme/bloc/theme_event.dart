// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}
class ThemeChange extends ThemeEvent {
 final bool isDark;
  ThemeChange({
    required this.isDark
  });
  
}
