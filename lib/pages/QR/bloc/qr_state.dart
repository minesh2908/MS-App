part of 'qr_bloc.dart';

@immutable
sealed class QrState {}

final class QrInitial extends QrState {}

final class QrLoadingState extends QrState {}

final class QrGenerationSuccessState extends QrState {
  final String data;
  Color? color;
  XFile? mobileimage;
  PlatformFile? webImage;

  QrGenerationSuccessState(
      {required this.data, this.color, this.mobileimage, this.webImage});
}

final class QrGenerationFailedState extends QrState {
  final String error;

  QrGenerationFailedState({required this.error});
}
