import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class mainApp extends StatelessWidget {
  const mainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterTts flutterTts = FlutterTts();
    final myController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TTS Application",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[400],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.purple[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText('TTS & Animated_text Application',
                  speed: Duration(milliseconds: 100),
                  textStyle: TextStyle(fontSize: 24, color: Colors.purple[400]))
            ]),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Text",
                hintText: "Type here",
              ),
              controller: myController,
            ),
            IconButton(
              onPressed: () {
                flutterTts.speak(myController.text);
                print("button pressed");
              },
              icon: Icon(Icons.mic),
              color: Colors.purple[400],
              iconSize: 60,
            )
          ],
        ),
      ),
    );
  }
}
