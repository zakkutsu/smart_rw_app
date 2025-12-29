# Smart RW App - Struktur Project

## 📁 Struktur Folder Profesional

Project ini telah direstrukturisasi menggunakan **feature-based architecture** untuk meningkatkan maintainability dan scalability.

```
lib/
├── main.dart                          # Entry point aplikasi
├── routes/
│   └── app_router.dart               # Centralized routing dengan GoRouter
├── screens/                          # Feature-based screens
│   ├── home/
│   │   └── home_screen.dart         # Dashboard utama (ex: dashboard_rw.dart)
│   ├── warga/
│   │   └── warga_screen.dart        # Manajemen data warga (ex: halaman_warga.dart)
│   ├── surat/
│   │   └── surat_screen.dart        # Layanan surat (ex: halaman_surat.dart)
│   ├── keuangan/
│   │   └── keuangan_screen.dart     # Laporan keuangan (ex: halaman_keuangan.dart)
│   ├── posyandu/
│   │   └── posyandu_screen.dart     # Data posyandu (ex: halaman_posyandu.dart)
│   └── kegiatan/
│       └── kegiatan_screen.dart     # Agenda kegiatan (ex: halaman_kegiatan.dart)
├── widgets/                          # Shared reusable widgets
│   └── common/
│       └── footer_rw.dart           # Footer widget digunakan di semua screens
└── config/                           # Configuration files (reserved untuk future)
```

## 🎯 Keuntungan Struktur Baru

### 1. **Feature-Based Organization**
- Setiap feature memiliki folder terpisah
- Mudah menemukan dan maintain code per-feature
- Scalable untuk penambahan feature baru

### 2. **Centralized Routing**
- Semua routes terdefinisi di `routes/app_router.dart`
- Mudah tracking navigasi aplikasi
- Konsisten dengan best practice GoRouter

### 3. **Consistent Naming**
- Screen files: `*_screen.dart`
- Widget files: `*_widget.dart`
- Lebih mudah identify jenis file

### 4. **Better Imports**
- Menggunakan relative imports yang jelas
- Pattern: `../../widgets/common/footer_rw.dart`
- Menghindari circular dependencies

## 📝 Migration Summary

### File Mapping
```
OLD STRUCTURE                    →    NEW STRUCTURE
----------------                      ----------------
lib/
├── dashboard_rw.dart           →    screens/home/home_screen.dart
├── halaman_warga.dart          →    screens/warga/warga_screen.dart
├── halaman_surat.dart          →    screens/surat/surat_screen.dart
├── halaman_keuangan.dart       →    screens/keuangan/keuangan_screen.dart
├── halaman_posyandu.dart       →    screens/posyandu/posyandu_screen.dart
├── halaman_kegiatan.dart       →    screens/kegiatan/kegiatan_screen.dart
└── widgets/
    └── footer_rw.dart          →    widgets/common/footer_rw.dart
```

### Routing Changes
- **Old**: Router defined di `main.dart`
- **New**: Extracted ke `routes/app_router.dart`
- **Import di main.dart**: `import 'routes/app_router.dart';`

## 🛠️ Technical Details

### Dependencies
- **flutter**: Framework
- **go_router**: Declarative routing
- **google_fonts**: Typography (Poppins)
- **fl_chart**: Charts & visualizations
- **intl**: Internationalization

### Clean Code Fixes Applied
1. ✅ Removed unused imports (`intl/intl.dart` di keuangan_screen)
2. ✅ Fixed deprecated `withOpacity()` → `withValues(alpha:)`
3. ✅ Fixed deprecated `value` → `initialValue` di DropdownButtonFormField
4. ✅ All screens properly import `../../widgets/common/footer_rw.dart`

## 🚀 Next Steps (Recommendations)

### 1. Add Models Layer
```
lib/models/
├── warga_model.dart      # Data class untuk Warga
├── surat_model.dart      # Data class untuk Surat
└── keuangan_model.dart   # Data class untuk Transaksi Keuangan
```

### 2. Add Services Layer
```
lib/services/
├── api_service.dart      # HTTP calls ke backend
├── warga_service.dart    # Business logic warga
└── storage_service.dart  # Local storage (SharedPreferences/Hive)
```

### 3. Add Utils/Helpers
```
lib/utils/
├── constants.dart        # App constants (colors, strings, endpoints)
├── helpers.dart          # Helper functions
└── validators.dart       # Form validators
```

### 4. State Management (jika diperlukan)
- Tambahkan Provider/Riverpod/BLoC untuk complex state
- Folder `lib/providers/` atau `lib/blocs/`

### 5. Theme Configuration
```dart
// lib/config/app_theme.dart
class AppTheme {
  static ThemeData get lightTheme => ThemeData(...);
  static ThemeData get darkTheme => ThemeData(...);
}
```

## ✅ Verification Checklist

- [x] Semua screens dipindah ke `screens/[feature]/`
- [x] Widgets reusable ada di `widgets/common/`
- [x] Routing terpusat di `routes/app_router.dart`
- [x] All imports updated dan valid
- [x] `flutter analyze`: 0 errors (hanya warning di test file)
- [x] `flutter pub get`: Success
- [x] File lama dihapus dari root `lib/`
- [x] Dokumentasi updated

## 🎨 Fitur Aplikasi (Existing)

### 1. **Home/Dashboard** (`screens/home/home_screen.dart`)
- Statistik ringkas (Total Warga, KK, Kas, Surat Pending)
- Grafik demografi (Pie Chart)
- List surat pengantar terbaru
- Menu navigasi ke semua fitur

### 2. **Data Warga** (`screens/warga/warga_screen.dart`)
- CRUD operations untuk data warga
- Form tambah/edit dengan validasi
- List warga dengan status (Tetap/Kontrak/Kost)
- Delete confirmation dialog

### 3. **Layanan Surat** (`screens/surat/surat_screen.dart`)
- List pengajuan surat warga
- Update status (Pending/Disetujui/Ditolak)
- Tracking per-jenis surat

### 4. **Keuangan** (`screens/keuangan/keuangan_screen.dart`)
- Display total saldo kas RW
- History transaksi (pemasukan/pengeluaran)
- Visual indicators untuk tipe transaksi

### 5. **Posyandu** (`screens/posyandu/posyandu_screen.dart`)
- Data balita dengan monitoring
- Status kesehatan (Sehat/Kurang Gizi)
- Visual warning untuk kondisi khusus

### 6. **Kegiatan RW** (`screens/kegiatan/kegiatan_screen.dart`)
- Agenda kegiatan upcoming & past
- Detail waktu, lokasi per-event
- Button konfirmasi kehadiran

## 📄 License & Credits

© 2025 Smart RW Dashboard - Sistem Informasi RW 05
Dibuat dengan ❤️ untuk kemudahan pelayanan warga

---

**Last Updated**: 29 Desember 2025
**Flutter Version**: Compatible with Flutter 3.x
**Restructuring**: Professional Feature-Based Architecture
