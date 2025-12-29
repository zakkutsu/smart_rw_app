import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const SmartRWApp());
}

class SmartRWApp extends StatelessWidget {
  const SmartRWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Smart RW Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Tema Biru Admin
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}