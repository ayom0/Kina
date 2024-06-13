import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kina/home.dart';

import 'halaman1.dart';
import 'halaman3.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman2());
}

class Halaman2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandscapePage(),
    );
  }
}

class LandscapePage extends StatefulWidget {
  @override
  _LandscapePageState createState() => _LandscapePageState();
}

class _LandscapePageState extends State<LandscapePage> {
  late AudioPlayer audioPlayer;
  bool isSoundOn = true; // State variable to track sound status

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _playVoiceOver();
  }

  Future<void> _playVoiceOver() async {
    if (isSoundOn) {
      await audioPlayer.play(AssetSource('audio/hal2.mp3'));
    }
  }

  void _toggleSound() {
    setState(() {
      isSoundOn = !isSoundOn;
      if (!isSoundOn) {
        audioPlayer.stop(); // Stop the audio if sound is turned off
      } else {
        _playVoiceOver(); // Play the audio if sound is turned on
      }
    });
  }

  void _stopAudio() {
    audioPlayer.pause(); // Pause the audio
    audioPlayer.seek(Duration.zero); // Rewind the audio to the beginning
  }

  void _navigateToNextPage() {
    _stopAudio(); // Stop the audio before navigating to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Halaman3()),
    );
  }

  void _navigateToPreviousPage() {
    _stopAudio(); // Stop the audio before navigating to the previous page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Halaman1()),
    );
  }

  void _home() {
    _stopAudio(); // Stop the audio before navigating to the previous page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Mulai()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/2.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: MediaQuery.of(context).size.width * 0.86,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: _home, // Navigate to Halaman4
                child: Image.asset(
                  'images/buttongohome.jpg',
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width * 0.86,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: _toggleSound, // Toggle sound on/off
                child: Image.asset(
                  isSoundOn ? 'images/buttonsound.jpg' : 'images/buttonsoundoff.jpg',
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width * 0.75,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: _navigateToNextPage, // Navigate to Halaman6
                child: Image.asset(
                  'images/buttongo.jpg',
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.43,
            left: 0,
            right: MediaQuery.of(context).size.width * 0.75,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: _navigateToPreviousPage, // Navigate to Halaman4
                child: Image.asset(
                  'images/buttonback.jpg',
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.68,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Akhirnya, wujud Adam menjadi sempurna saat Allah meniupkan ruh kepadanya',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.015,
                      fontFamily: "Bryndan_Write",
                      color: Colors.white,
                    ),
                    speed: Duration(milliseconds: 50), // kecepatan muncul tulisan
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),
          ),
        ],
      ),
);}}