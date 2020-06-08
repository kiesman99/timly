import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:soundpool/soundpool.dart';

class SoundProvider extends ChangeNotifier {

  Soundpool _pool = Soundpool();

  Future<int> _shortBeepId;
  Future<int> _longBeepId;

  SoundProvider() {
    _shortBeepId = _loadShortBeep();
    _longBeepId = _loadLongBeep();
  }

  Future<int> _loadShortBeep() async {
    var asset = await rootBundle.load("assets/sounds/beep_short.mp3");
    return _pool.load(asset);
  }

  Future<int> _loadLongBeep() async {
    var asset = await rootBundle.load("assets/sounds/beep_long.mp3");
    return _pool.load(asset);
  }

  Future<void> playLongBeep() async {
    var longBeep = await _longBeepId;
    _pool.play(longBeep);
  }

  Future<void> playShortBeep() async {
    var shortBeep = await _shortBeepId;
    _pool.play(shortBeep);
  }

  @override
  void dispose() {
    _pool.dispose();
    super.dispose();
  }

}