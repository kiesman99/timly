import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:tyme/bloc/burn_in/burn_in_event.dart';
import 'package:tyme/bloc/burn_in/burn_in_state.dart';
import 'package:tyme/utils/logger.dart';

const Duration protectTimeoutDuration = Duration(seconds: 30);

class BurnInBloc extends Bloc<BurnInEvent, BurnInState> with LoggerMixin {
  BurnInBloc() : super(const BurnInState.unconcerning()) {
    _timer ??= Timer.periodic(protectTimeoutDuration, (_) {
      if (state is Protect) {
        add(const BurnInEvent.protect());
      }
    });
  }

  Timer _timer;

  @override
  Stream<BurnInState> mapEventToState(BurnInEvent event) async* {
    _logging(event);

    yield* event.when(
        touched: () => _mapTouchedEventToState(event as Touched),
        protect: () => _mapProtectEventToState(event as Protect));
  }

  Stream<BurnInState> _mapTouchedEventToState(Touched event) async* {
    _timer?.cancel();
    _timer = Timer.periodic(
        protectTimeoutDuration, (_) => add(const BurnInEvent.protect()));
    yield const BurnInState.unconcerning();
  }

  Stream<BurnInState> _mapProtectEventToState(Protect event) async* {
    yield BurnInState.protecting(
        Random().nextInt(150).toDouble(), Random().nextInt(150).toDouble());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void _logging(BurnInEvent event) {
    event?.when(
        touched: () => loggerNS.i('Touched Event released!'),
        protect: () => loggerNS.i('Starting BurnInProtection.'));
  }
}
