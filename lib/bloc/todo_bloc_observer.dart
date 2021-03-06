import 'dart:developer';

import 'package:bloc/bloc.dart';

class TodoBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log("=== onEvent ===");
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("=== onChange ===");
    super.onChange(bloc, change);
    print('onChange $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("=== onTransition ===");
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("=== onError ===");
    super.onError(bloc, error, stackTrace);
    print('${bloc.runtimeType} $error');
  }
}
