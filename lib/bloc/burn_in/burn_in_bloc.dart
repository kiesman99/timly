import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:timly/bloc/burn_in/burn_in_event.dart';
import 'package:timly/bloc/burn_in/burn_in_state.dart';

const protectTimeoutDuration = const Duration(seconds: 30);

class BurnInBloc extends Bloc<BurnInEvent, BurnInState> {
  Timer _timer;

  BurnInBloc() {
    if (this._timer == null) {
      _timer = Timer.periodic(
          protectTimeoutDuration, (_) => this.add(BurnInEvent.protect()));
    }
  }

  @override
  BurnInState get initialState => BurnInState.unconcerning();

  @override
  Stream<BurnInState> mapEventToState(BurnInEvent event) async* {
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
}
