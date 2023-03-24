import 'package:audioplayers/audioplayers.dart';

class SoundLogic {
  static const SOUND_DATA = 'sounds/bell.mp3';

  final AudioCache _cache = AudioCache(
    fixedPlayer: AudioPlayer(),
  );

  void load() {
    _cache.load(SOUND_DATA);
  }

  void playSound() {
    _cache.play(SOUND_DATA);
  }
}
