import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman9());
}

class Halaman9 extends StatelessWidget {
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
                image: AssetImage('images/bghal9.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 200, // Sesuaikan dengan posisi vertikal yang diinginkan
            left: 30, // Atur posisi horizontal sesuai keinginan
            right: 500,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              height: 170, // Sesuaikan dengan tinggi yang diinginkan
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.8), // Warna coklat dengan transparansi 80%
                borderRadius: BorderRadius.circular(30), // Radius sudut 30
              ),
              child: Text(
                '"sekali-kali kamu tidak akan mati  dan akan kekal" Hawa itu melihat, bahwa buah pohon itu baik untuk dimakan dan sedap kelihatannya, lagipula pohon itu menarik hati karena memberi pengertian',
                textAlign: TextAlign.center, // Teks berada di tengah
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
