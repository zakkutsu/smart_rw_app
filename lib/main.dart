import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dashboard_rw.dart';
import 'halaman_warga.dart';
import 'halaman_surat.dart';
import 'halaman_keuangan.dart';
import 'halaman_posyandu.dart';
import 'halaman_kegiatan.dart';

void main() {
  runApp(const SmartRWApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardRW(),
    ),
    GoRoute(
      path: '/warga',
      builder: (context, state) => const HalamanWarga(),
    ),
    GoRoute(path: '/surat', builder: (context, state) => const HalamanSurat()),
    GoRoute(path: '/keuangan', builder: (context, state) => const HalamanKeuangan()),
    GoRoute(path: '/posyandu', builder: (context, state) => const HalamanPosyandu()),
    GoRoute(path: '/kegiatan', builder: (context, state) => const HalamanKegiatan()),
  ],
);

class SmartRWApp extends StatelessWidget {
  const SmartRWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
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