import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kina/home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman21());
}

class Halaman21 extends StatelessWidget {
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
      await audioPlayer.play(AssetSource('audio/halaman21.mp3'));
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
                image: AssetImage('images/revbghal21.jpg'),
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
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.35,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.48,
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Dalam cerita ini, kita belajar bahwa sombong dan durhaka tidak akan pernah membawa kebahagiaan. Kebaikan, kejujuran, dan kesetiaan kepada Allahlah yang akan membawa kita kepada cahaya dan kebahagiaan yang sejati.',
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.02,
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