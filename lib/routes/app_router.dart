import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/warga/warga_screen.dart';
import '../screens/surat/surat_screen.dart';
import '../screens/keuangan/keuangan_screen.dart';
import '../screens/posyandu/posyandu_screen.dart';
import '../screens/kegiatan/kegiatan_screen.dart';

/// Centralized routing configuration untuk Smart RW App
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/warga',
      builder: (context, state) => const WargaScreen(),
    ),
    GoRoute(
      path: '/surat',
      builder: (context, state) => const SuratScreen(),
    ),
    GoRoute(
      path: '/keuangan',
      builder: (context, state) => const KeuanganScreen(),
    ),
    GoRoute(
      path: '/posyandu',
      builder: (context, state) => const PosyanduScreen(),
    ),
    GoRoute(
      path: '/kegiatan',
      builder: (context, state) => const KegiatanScreen(),
    ),
  ],
);
