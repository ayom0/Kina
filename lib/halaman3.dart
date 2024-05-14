import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman3());
}

class Halaman3 extends StatelessWidget {
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
                image: AssetImage('images/bghal3.jpg'),
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
                'Akhirnya, wujud Adam menjadi sempurna saat Allah meniupkan ruh kepadanya. Allah menyuruh para malaikat bersujud kepada Adam sebagai penghormatan, namun, ada satu makhluk yang membangkang',
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
