import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeChange>(themeChange);
  }

  FutureOr<void> themeChange(ThemeChange event, Emitter<ThemeMode> emit) {
    emit(event.isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
