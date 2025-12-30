# 🏘️ Smart RW Dashboard

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![Version](https://img.shields.io/badge/Version-1.0.0-blue)
![Platform](https://img.shields.io/badge/Platform-Web%20|%20Mobile%20|%20Desktop-orange)

**Platform Digitalisasi Administrasi & Kependudukan Tingkat Desa**

Bagian dari Ekosistem **Smart Village** - Modul Sistem Informasi RW

[Fitur](#-fitur-utama) • [Instalasi](#-instalasi) • [Teknologi](#-teknologi) • [Roadmap](#-roadmap) • [Kontribusi](#-kontribusi)

</div>

---

## 📖 Tentang Aplikasi

**Smart RW Dashboard** adalah sistem informasi manajemen administrasi dan kependudukan untuk pengurus RW yang bertujuan **mendigitalisasi data warga, keuangan, dan pelayanan publik di tingkat desa**. Aplikasi ini menghubungkan pengurus RW dengan warga dalam satu ekosistem digital yang transparan, efisien, dan mudah digunakan.

### 🎯 Misi
- Mendigitalisasi sistem administrasi RW yang masih manual
- Meningkatkan transparansi pengelolaan keuangan RW
- Mempercepat proses pelayanan surat-menyurat
- Memudahkan monitoring kesehatan balita (Posyandu)
- Mengkoordinasi kegiatan warga dengan lebih terstruktur

> *Dibuat berdasarkan Proposal "Peningkatan Perekonomian Masyarakat Desa" - Modul Smart RW*

---

## ✨ Fitur Utama

### 🏠 **Dashboard Eksekutif**
- **Statistik Ringkas**: Total warga, kepala keluarga, kas RW, dan surat pending
- **Visualisasi Data**: Grafik Demografi Usia menggunakan **Pie Chart** (fl_chart) - distribusi Dewasa, Anak, Lansia
- **Timeline Aktivitas**: List surat pengantar terbaru dengan status (Baru, Proses, Selesai)
- **Menu Navigasi**: Quick access ke semua fitur layanan
- **Layout Responsif**: Beradaptasi otomatis untuk layar Laptop (Wide) dan HP (Mobile)

### 👥 **Manajemen Data Warga (CRUD)**
- **Create**: Menambah warga baru dengan form lengkap
- **Read**: Melihat daftar penduduk dengan detail lengkap
- **Update**: Mengedit data warga (NIK, nama, pekerjaan, status)
- **Delete**: Menghapus data dengan konfirmasi keamanan
- **Filtering**: Filter berdasarkan status (Warga Tetap, Kontrak, Kost)
- **Validasi Form**: Input NIK (16 digit), nama, pekerjaan dengan validasi

### 📧 **Layanan Administrasi Surat**
- **Surat Pengantar**: Simulasi persetujuan (Acc) surat warga
- **Tracking Pengajuan**: Monitor status surat (Pending, Disetujui, Ditolak)
- **Jenis Surat**: SKCK, Domisili Usaha, Keterangan Tidak Mampu, dll
- **Update Status**: Approve/reject langsung dari dashboard
- **History**: Riwayat semua pengajuan surat

### 💰 **Manajemen Keuangan Kas RW**
- **Laporan Kas**: Display total saldo kas RW real-time
- **Pemasukan**: Iuran warga, donasi, dan sumber dana lainnya
- **Pengeluaran**: Operasional, perbaikan, konsumsi rapat
- **Visualisasi**: Color indicator - pemasukan (hijau ↑) dan pengeluaran (merah ↓)
- **History Transaksi**: Riwayat lengkap dengan tanggal dan nominal

### 👶 **Posyandu - Monitoring Kesehatan Balita**
- **Data Balita**: Monitoring nama, usia, berat badan
- **Status Kesehatan**: Sehat, Kurang Gizi dengan color coding
- **Alert System**: Visual warning (orange) untuk kondisi khusus
- **Tracking Berkala**: Update data setiap bulan
- **Catatan Perkembangan**: History pertumbuhan per-balita

### 📅 **Jadwal Agenda Kegiatan RW**
- **Kerja Bakti Masal**: Agenda gotong royong warga
- **Rapat RW**: Koordinasi pengurus dan RT
- **Posyandu Bulanan**: Jadwal pemeriksaan kesehatan
- **Detail Lengkap**: Tanggal, waktu (WIB), lokasi per-event
- **Status Visual**: Upcoming (active) vs Past events (completed)
- **RSVP**: Button konfirmasi kehadiran warga

### 📱 **UI/UX Modern**
- Material Design 3
- Blue admin theme (Professional & trustworthy)
- Gradient headers & card-based layout
- Responsive design (Desktop & Mobile)
- Loading states & form validations
- Success dialogs & confirmations
- Smooth navigation transitions

---

## 🛠️ Teknologi

### Core Stack
- **Flutter 3.x** - Cross-platform framework
- **Dart 3.x** - Programming language
- **Material Design 3** - UI design system

### Dependencies
```yaml
dependencies:
  go_router: ^12.0.0              # Declarative routing
  fl_chart: ^0.65.0               # Data visualization (Pie Chart)
  google_fonts: ^6.1.0            # Poppins typography
  intl: ^0.18.0                   # Date & number formatting
```

### Architecture
- **GoRouter** - Declarative routing
- **Feature-based Structure** - Organized by modules
- **Stateful Widgets** - Local state management
- **Repository Pattern Ready** - For backend integration

---

## 🚀 Instalasi

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Chrome (untuk web) atau Android Studio/Xcode (untuk mobile)
- Git untuk version control

### Step-by-Step

1. **Clone Repository**
   ```bash
   git clone https://github.com/zakkutsu/smart_rw_app.git
   cd smart_rw_app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run Application**
   
   **Web (Chrome):**
   ```bash
   flutter run -d chrome
   ```
   
   **Mobile (Android):**
   ```bash
   flutter run -d <device-id>
   ```
   
   **Desktop (Windows):**
   ```bash
   flutter run -d windows
   ```

4. **Build for Production**
   ```bash
   # Web
   flutter build web
   
   # Android APK
   flutter build apk --release
   
   # Android App Bundle
   flutter build appbundle --release
   
   # iOS (requires macOS)
   flutter build ios --release
   
   # Windows Desktop
   flutter build windows --release
   ```

---

## 📁 Struktur Project

```
lib/
├── main.dart                       # Entry point + GoRouter setup
├── routes/
│   └── app_router.dart             # Centralized routing (6 routes)
├── screens/                        # Feature-based screens
│   ├── home/
│   │   └── home_screen.dart        # Dashboard utama + statistik
│   ├── warga/
│   │   └── warga_screen.dart       # CRUD data kependudukan
│   ├── surat/
│   │   └── surat_screen.dart       # Layanan surat pengantar
│   ├── keuangan/
│   │   └── keuangan_screen.dart    # Laporan kas RW
│   ├── posyandu/
│   │   └── posyandu_screen.dart    # Data kesehatan balita
│   └── kegiatan/
│       └── kegiatan_screen.dart    # Agenda & jadwal kegiatan
└── widgets/
    └── common/
        └── footer_rw.dart          # Reusable footer component
```

**Total:** 6 screens, 6 routes, 1 reusable widget

---

## 🎮 Cara Menggunakan

### Sebagai Pengurus RW (Admin)

1. **Dashboard Overview:**
   - Buka aplikasi → Lihat statistik ringkas
   - Cek grafik demografi warga
   - Monitor surat pengantar terbaru
   - Navigasi ke fitur via menu grid

2. **Kelola Data Warga:**
   - Klik "Data Warga" → Lihat daftar penduduk
   - **Tambah Warga:** Klik FAB → Isi form (Nama, NIK, Status, Pekerjaan) → Simpan
   - **Edit Data:** PopupMenu → Edit → Update form → Simpan
   - **Hapus Data:** PopupMenu → Hapus → Konfirmasi

3. **Proses Surat:**
   - Klik "Surat" → Lihat list pengajuan
   - Tap chip status → Pilih: Disetujui / Ditolak / Pending
   - Status terupdate real-time

4. **Catat Keuangan:**
   - Klik "Keuangan" → Lihat saldo kas
   - Klik FAB "Catat Kas" → Input transaksi (coming soon)
   - Monitoring pemasukan (↑ hijau) & pengeluaran (↓ merah)

5. **Update Posyandu:**
   - Klik "Posyandu" → Lihat data balita
   - Monitor status kesehatan (Sehat / Kurang Gizi dengan color coding)
   - Update data berkala setiap bulan

6. **Kelola Kegiatan:**
   - Klik "Kegiatan RW" → Lihat agenda
   - Events upcoming (aktif) vs past (selesai)
   - Klik FAB → Tambah event baru (coming soon)
   - Konfirmasi kehadiran warga

---

## 🗺️ Roadmap

### ✅ Version 1.0.0 (Current) - Core Features Complete
- [x] Dashboard eksekutif dengan statistik
- [x] Visualisasi demografi (Pie Chart)
- [x] CRUD data warga lengkap
- [x] Sistem surat dengan status tracking
- [x] Manajemen keuangan kas RW
- [x] Monitoring posyandu balita
- [x] Jadwal kegiatan RW
- [x] Responsive design (Desktop & Mobile)
- [x] Feature-based architecture
- [x] Centralized routing dengan GoRouter

### 🚧 Version 1.1.0 (Q1 2026) - Enhanced UX
- [ ] Search & filter data warga
- [ ] Export laporan ke PDF
- [ ] Print surat pengantar
- [ ] Notifikasi untuk surat pending
- [ ] Dark mode theme
- [ ] Sorting & pagination

### 🔮 Version 2.0.0 (Q2 2026) - Backend Integration
- [ ] Firebase Authentication (Admin login)
- [ ] Firestore database untuk persistent data
- [ ] Cloud storage untuk foto warga
- [ ] Real-time sync antar devices
- [ ] Backup & restore data
- [ ] API integration ready

### 🌟 Version 3.0.0 (Q3 2026) - Advanced Features
- [ ] Multi-RW support (1 app untuk beberapa RW)
- [ ] Role-based access (Admin RW, RT, Sekretaris)
- [ ] Warga portal (akses terbatas untuk warga)
- [ ] Chat antara pengurus & warga
- [ ] Push notifications
- [ ] Analytics dashboard lanjutan
- [ ] Integration dengan e-KTP API

---

## 🔒 Security & Privacy

### Implemented
- ✅ Input validation (form fields)
- ✅ Delete confirmation dialogs
- ✅ Safe state management

### To Implement (Next Versions)
- ⏳ Admin authentication & authorization
- ⏳ Data encryption (sensitive info like NIK)
- ⏳ Role-based access control
- ⏳ Audit log (who changed what)
- ⏳ HTTPS only in production
- ⏳ GDPR compliance (data privacy)

---

## 🧪 Testing

### Current Status
- Manual testing ✅
- Route navigation ✅
- CRUD operations ✅
- Responsive layout ✅

### Recommended Tests
```bash
# Run all tests
flutter test

# Coverage report
flutter test --coverage

# Analyze code quality
flutter analyze

# Check formatting
dart format lib/
```

**Test Coverage Goals:**
- [ ] Unit tests (Data models, Utils)
- [ ] Widget tests (Forms, Dialogs, Cards)
- [ ] Integration tests (Complete CRUD flow)

---

## 🤝 Kontribusi

Kami terbuka untuk kontribusi! Berikut cara berkontribusi:

1. **Fork** repository ini
2. **Create branch** untuk fitur baru
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit** perubahan Anda
   ```bash
   git commit -m "feat: Add some AmazingFeature"
   ```
4. **Push** ke branch
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open Pull Request**

### Commit Convention
```
feat: Fitur baru
fix: Bug fix
docs: Dokumentasi
refactor: Refactoring code
style: Formatting
test: Testing
chore: Maintenance
```

### Coding Standards
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Format code dengan `dart format lib/`
- Run `flutter analyze` sebelum commit (0 errors required)
- Write meaningful commit messages
- Update dokumentasi jika diperlukan
- Test di minimal 2 platform (Web + Mobile)

---

## 📄 License

Project ini menggunakan **MIT License** - bebas digunakan untuk keperluan komersial maupun non-komersial.

```
MIT License - Copyright (c) 2025 Smart RW Development Team
```

---

## 👥 Tim Pengembang

**Smart RW Development Team**
- Smart Village Initiative
- Modul Sistem Informasi RW - Digitalisasi Administrasi Desa

---

## 📞 Kontak & Support

- 📧 Email: admin.rw05@smartvillage.id (placeholder)
- 🌐 Website: https://smartrw.id (placeholder)
- 📱 WhatsApp: +62 812-3456-7890 (placeholder)
- 💬 Telegram: [@SmartRWSupport](https://t.me/smartrw) (placeholder)

---

## � Acknowledgments

Terima kasih kepada:
- Flutter Team untuk framework yang luar biasa
- Komunitas Flutter Indonesia untuk support & inspirasi
- Pengurus RW & RT yang menginspirasi digitalisasi administrasi desa
- Pemerintah Desa yang mendukung program Smart Village
- Icon dari [Material Icons](https://fonts.google.com/icons)
- Font Poppins dari [Google Fonts](https://fonts.google.com/)
- Charts library dari [FL Chart](https://pub.dev/packages/fl_chart)
- Routing dari [GoRouter](https://pub.dev/packages/go_router)

---

## 📊 Project Statistics

- **Version:** 1.0.0
- **Total Screens:** 6 (Home, Warga, Surat, Keuangan, Posyandu, Kegiatan)
- **Total Routes:** 6 public routes
- **Code Lines:** 1,200+
- **Dependencies:** 4 packages
- **Supported Platforms:** Web, Android, iOS, Windows, macOS, Linux
- **Last Updated:** 30 Desember 2025

---

<div align="center">

**Dibuat dengan ❤️ untuk Kemajuan Administrasi Desa**

**© 2025 Smart RW Dashboard** - Sistem Informasi RW Digital

⭐ Star project ini jika bermanfaat untuk RW Anda!

[⬆ Kembali ke atas](#-smart-rw-dashboard)

</div>
