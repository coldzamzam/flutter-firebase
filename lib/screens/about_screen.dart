import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Aplikasi Firebase Auth Mahasiswa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Aplikasi ini dibuat untuk menunjukkan bagaimana cara '
              'menggunakan Firebase Authentication dan Firestore di Flutter. '
              'Fitur utama dari aplikasi ini antara lain:',
            ),
            SizedBox(height: 10),
            Text('• Login dengan email dan password'),
            Text('• Registrasi user baru dengan nama, NIM, email, dan password'),
            Text('• Verifikasi email'),
            Text('• Menampilkan informasi user dari Firestore'),
            Text('• Logout'),
            SizedBox(height: 20),
            Text(
              'Dibuat oleh:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('1. Aqsa Zamzami'),
            Text('2. Ahmad Mukhlash Muhtady'),
            SizedBox(height: 20),
            Text('Kelas: TI-4B'),
          ],
        ),
      ),
    );
  }
}
