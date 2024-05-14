import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman4());
}

class Halaman4 extends StatelessWidget {
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
                image: AssetImage('images/bghal4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 80, // Sesuaikan dengan posisi vertikal yang diinginkan
            left: 500, // Atur posisi horizontal sesuai keinginan
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              height: 120, // Sesuaikan dengan tinggi yang diinginkan
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.8), // Warna coklat dengan transparansi 80%
                borderRadius: BorderRadius.circular(30), // Radius sudut 30
              ),
              child: Text(
                'Di dalam syurga yang indah, Nabi Adam a.s. telah diberi kehormatan oleh Allah s.w.t. dengan ditempatkan di syurga. Namun, beliau diberi satu arahan: jangan mendekati satu pohon tertentu',
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
