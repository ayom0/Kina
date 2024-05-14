import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman11());
}

class Halaman11 extends StatelessWidget {
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
                image: AssetImage('images/bghal11.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 320, // Sesuaikan dengan posisi vertikal yang diinginkan
            left: 20, // Atur posisi horizontal sesuai keinginan
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              height: 160, // Sesuaikan dengan tinggi yang diinginkan
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.8), // Warna coklat dengan transparansi 80%
                borderRadius: BorderRadius.circular(30), // Radius sudut 30
              ),
              child: Text(
                '"Turunlah kamu! Kamu akan saling bermusuhan satu sama lain. Bumi adalah tempat kediaman dan kesenangan sampai waktu yang telah ditentukan. Di sana kamu hidup, di sana kamu mati dan dari sana (pula) kamu akan dibangkitkan." (QS 7:24-25).',
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
