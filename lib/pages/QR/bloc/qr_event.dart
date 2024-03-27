part of 'qr_bloc.dart';

@immutable
sealed class QrEvent {}

final class GenerateQrEvent extends QrEvent {
  final String linkGenerationText;
  XFile? selectedImage;
  Color? selectedColor = Colors.black;
  GenerateQrEvent(
      {required this.linkGenerationText,
      this.selectedColor,
      this.selectedImage});
}
