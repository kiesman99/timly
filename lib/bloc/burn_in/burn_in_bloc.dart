import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:timly/bloc/burn_in/burn_in_event.dart';
import 'package:timly/bloc/burn_in/burn_in_state.dart';
import 'package:timly/utils/logger.dart';

const protectTimeoutDuration = const Duration(seconds: 30);

class BurnInBloc extends Bloc<BurnInEvent, BurnInState> with LoggerMixin {
  Timer _timer;

  BurnInBloc() : super(BurnInState.unconcerning()) {
    if (this._timer == null) {
      _timer = Timer.periodic(
          protectTimeoutDuration, (_) {
            if (this.state is Protect) {
              this.add(BurnInEvent.protect());
            }
      });
    }
  }

  @override
  Stream<BurnInState> mapEventToState(BurnInEvent event) async* {
    _logging(event);

    yield* event.when(
        touched: () => _mapTouchedEventToState(event),
        protect: () => _mapProtectEventToState(event));
  }

  Stream<BurnInState> _mapTouchedEventToState(Touched event) async* {
    _timer?.cancel();
    _timer = Timer.periodic(
        protectTimeoutDuration, (_) => this.add(BurnInEvent.protect()));
    yield BurnInState.unconcerning();
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
        touched: () => loggerNS.i("Touched Event released!"),
        protect: () => loggerNS.i("Starting BurnInProtection.")
    );
  }
}
