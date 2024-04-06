import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:space_app/model/helper.dart';
import 'package:space_app/repo/helper_api.dart';

part 'helper_event.dart';
part 'helper_state.dart';

class HelperBloc extends Bloc<HelperEvent, HelperState> {
  HelperBloc() : super(HelperInitial()) {
    on<HelperGenerateEvent>(helperGenerateEvent);
    on<HelperPopEvent>(helperPopEvent);
  }

  FutureOr<void> helperGenerateEvent(
    HelperGenerateEvent event,
    Emitter<HelperState> emit,
  ) async {
    emit(HelperLoadingState());
    print('----------------');
    print(state);
    try {
      final helperResult = await HelperApi.HelperGenerationApi([
        HelperModel(parts: [HelperPartModel(text: event.helperText)]),
      ]);
      emit(HelperSuccessState(helperResult: helperResult!));
      print('----------------');
      print(state);
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> helperPopEvent(
    HelperPopEvent event,
    Emitter<HelperState> emit,
  ) {
    emit(HelperInitial());
  }
}
