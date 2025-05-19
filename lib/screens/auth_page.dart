import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signin_screen.dart';
import 'userinfo_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Cek apakah user sudah login
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          final user = snapshot.data!;
          // Cek apakah email user sudah diverifikasi
          if (user.emailVerified) {
            return const UserInfoScreen();
          } else {
            return const UserInfoScreen(); // bisa juga tampilkan layar khusus
          }
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
