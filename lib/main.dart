import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_speech/tts_function.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: Scaffold(
            body: Center(child: TextToSpeech()),
          ),
        ));
  }
}

class TextToSpeech extends StatefulWidget {
  TextToSpeech({Key? key}) : super(key: key);

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  final TextEditingController textEditingController = TextEditingController();

  String voice = "en-US";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: textEditingController,
            ),
            ElevatedButton(
                onPressed: () => speak(textEditingController.text, voice),
                child: const Text("Speak Now!")),
            const SizedBox(height: 32),
            DropdownButton<String>(
                value: voice,
                items: <String>['en-US', 'ja-JP', 'hi-IN', 'ru-RU', 'ko-KR']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    voice = value!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
