part of 'qr_bloc.dart';

@immutable
sealed class QrEvent {}

final class GenerateQrEvent extends QrEvent {
  final String linkGenerationText;
  XFile? mobileSelectedImage;
  Color? selectedColor = Colors.black;
  PlatformFile? webSelectedImage;
  GenerateQrEvent(
      {required this.linkGenerationText,
      this.selectedColor,
      this.mobileSelectedImage,
      this.webSelectedImage});
}
