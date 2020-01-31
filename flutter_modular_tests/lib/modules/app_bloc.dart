import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ApplicationInitializationEvent {
  start,
  initialized,
}

class ApplicationInitializationBloc
    extends Bloc<ApplicationInitializationEvent, ApplicationInitializationState>
    with ChangeNotifier {
  @override
  ApplicationInitializationState get initialState =>
      ApplicationInitializationState.notInitialized();

  @override
  Stream<ApplicationInitializationState> mapEventToState(
      ApplicationInitializationEvent event) async* {
    if (event == ApplicationInitializationEvent.start) {
      for (int progress = 0; progress < 101; progress += 1) {
        await Future.delayed(const Duration(milliseconds: 20));
        yield ApplicationInitializationState.progressing(progress);
        notifyListeners();
      }
    } else if (event == ApplicationInitializationEvent.initialized) {
      yield ApplicationInitializationState.initialized();
      notifyListeners();
    } else {
      throw UnimplementedError('unhandled event: $event');
    }
  }
}

class ApplicationInitializationState {
  ApplicationInitializationState({
    @required this.isInitialized,
    this.isInitializing: false,
    this.progress: 0,
  });

  final bool isInitialized;
  final bool isInitializing;
  final int progress;

  factory ApplicationInitializationState.notInitialized() {
    return ApplicationInitializationState(
      isInitialized: false,
    );
  }

  factory ApplicationInitializationState.progressing(int progress) {
    return ApplicationInitializationState(
      isInitialized: progress == 100,
      isInitializing: true,
      progress: progress,
    );
  }

  factory ApplicationInitializationState.initialized() {
    return ApplicationInitializationState(
      isInitialized: true,
      progress: 100,
    );
  }
}
