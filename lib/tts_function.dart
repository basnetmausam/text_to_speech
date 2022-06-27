import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
speak(String text, String voice) async {
  await flutterTts.setLanguage(voice);
  await flutterTts.setPitch(1.2);
  await flutterTts.speak(text);
}
