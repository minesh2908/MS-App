part of 'helper_bloc.dart';

@immutable
sealed class HelperState {}

final class HelperInitial extends HelperState {}

final class HelperLoadingState extends HelperInitial {}

final class HelperSuccessState extends HelperInitial {
  final String helperResult;

  HelperSuccessState({required this.helperResult});
}

final class HelperErrorState extends HelperInitial {}
