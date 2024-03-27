part of 'qr_bloc.dart';

@immutable
sealed class QrState {}

final class QrInitial extends QrState {}

final class QrLoadingState extends QrState {}

final class QrGenerationSuccessState extends QrState {
  final String data;
  Color? color;
  XFile? image;

  QrGenerationSuccessState({required this.data, this.color, this.image});
}

final class QrGenerationFailedState extends QrState {
  final String error;

  QrGenerationFailedState({required this.error});
}
