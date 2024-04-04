import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<GenerateQrEvent>(generateQrEvent);
  }

  FutureOr<void> generateQrEvent(GenerateQrEvent event, Emitter<QrState> emit) {
    emit(QrLoadingState());

    try {
      emit(
        QrGenerationSuccessState(
          data: event.linkGenerationText,
          color: event.selectedColor,
          mobileimage: event.mobileSelectedImage,
        ),
      );
    } catch (e) {
      emit(QrGenerationFailedState(error: e.toString()));
      print(e);
    }
  }
}
