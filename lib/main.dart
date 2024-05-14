import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kina/halaman16.dart';
//import 'package:kina/halaman1.dart';
//import 'package:kina/halaman4.dart';
//import 'package:kina/halaman9.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Mulai());
}

class Mulai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandscapePage(),
    );
  }
}

class LandscapePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bghome.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 230, // Mengatur tombol di bagian atas kontainer
            left: 0, // Anda juga dapat menggunakan right atau centerLeft, centerRight sesuai kebutuhan
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Halaman16()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  minimumSize: Size(200, 50),
                  primary: Color.fromARGB(255, 245, 241, 13),
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Mulai',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
