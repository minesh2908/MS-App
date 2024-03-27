import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<GenerateQrEvent>(generateQrEvent);
  }

  FutureOr<void> generateQrEvent(GenerateQrEvent event, Emitter<QrState> emit) {
    emit(QrLoadingState());

    try {
      emit(QrGenerationSuccessState(
          data: event.linkGenerationText,
          color: event.selectedColor,
          image: event.selectedImage));
    } catch (e) {
      emit(QrGenerationFailedState(error: e.toString()));
      print(e.toString());
    }
  }
}
