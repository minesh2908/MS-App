part of 'qr_bloc.dart';

@immutable
sealed class QrState {}

final class QrInitial extends QrState {}

final class QrLoadingState extends QrState {}

final class QrGenerationSuccessState extends QrState {
  QrGenerationSuccessState({
    required this.data,
    this.color,
    this.mobileimage,
    this.webImage,
  });
  final String data;
  Color? color;
  XFile? mobileimage;
  PlatformFile? webImage;
}

final class QrGenerationFailedState extends QrState {
  QrGenerationFailedState({required this.error});
  final String error;
}
