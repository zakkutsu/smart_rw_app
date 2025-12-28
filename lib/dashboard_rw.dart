import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/footer_rw.dart';

class DashboardRW extends StatelessWidget {
  const DashboardRW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      // Header Admin
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.security, size: 20)),
            SizedBox(width: 10),
            Text("Admin RW 05", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, color: Colors.white)),
          const SizedBox(width: 10),
        ],
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECTION 1: STATISTIK RINGKAS ---
            const Text("Ringkasan Data", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            // Tampilan Responsif untuk Kartu Statistik
            LayoutBuilder(builder: (context, constraints) {
              return Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  _kartuStatistik("Total Warga", "450 Jiwa", Icons.people, Colors.blue, constraints.maxWidth),
                  _kartuStatistik("Kepala Keluarga", "120 KK", Icons.home, Colors.orange, constraints.maxWidth),
                  _kartuStatistik("Kas RW", "Rp 15.2jt", Icons.account_balance_wallet, Colors.green, constraints.maxWidth),
                  _kartuStatistik("Surat Pending", "3", Icons.warning, Colors.red, constraints.maxWidth),
                ],
              );
            }),

            const SizedBox(height: 30),

            // --- SECTION 2: GRAFIK & AKTIVITAS (Biar tidak RAW) ---
            // Jika layar lebar (Laptop), grafik & list bersandingan. Jika HP, atas-bawah.
            LayoutBuilder(
              builder: (context, constraints) {
                bool isWide = constraints.maxWidth > 800;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GRAFIK DEMOGRAFI (Pie Chart)
                    Container(
                      width: isWide ? 400 : double.infinity,
                      height: 300,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const Text("Demografi Usia", style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          Expanded(
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 2,
                                centerSpaceRadius: 40,
                                sections: [
                                  PieChartSectionData(color: Colors.blue, value: 40, title: "40%", radius: 50, titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  PieChartSectionData(color: Colors.orange, value: 30, title: "30%", radius: 50, titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  PieChartSectionData(color: Colors.purple, value: 30, title: "30%", radius: 50, titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              _Legend(color: Colors.blue, text: "Dewasa"),
                              SizedBox(width: 10),
                              _Legend(color: Colors.orange, text: "Anak"),
                              SizedBox(width: 10),
                              _Legend(color: Colors.purple, text: "Lansia"),
                            ],
                          )
                        ],
                      ),
                    ),
                    
                    SizedBox(width: isWide ? 20 : 0, height: isWide ? 0 : 20),

                    // LIST AKTIVITAS TERBARU
                    Expanded(
                      flex: isWide ? 1 : 0,
                      child: Container(
                        height: 300,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Surat Pengantar Terbaru", style: TextStyle(fontWeight: FontWeight.bold)),
                            const Divider(),
                            Expanded(
                              child: ListView(
                                children: const [
                                  ListTile(
                                    leading: Icon(Icons.mail_outline, color: Colors.blue),
                                    title: Text("Bpk. Ahmad Sujadi"),
                                    subtitle: Text("Pengantar SKCK - 5 menit lalu"),
                                    trailing: Chip(label: Text("Baru"), backgroundColor: Colors.blue, labelStyle: TextStyle(color: Colors.white, fontSize: 10)),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.mail_outline, color: Colors.blue),
                                    title: Text("Ibu Ratna Sari"),
                                    subtitle: Text("Domisili Usaha - 1 jam lalu"),
                                    trailing: Chip(label: Text("Proses"), backgroundColor: Colors.orange, labelStyle: TextStyle(color: Colors.white, fontSize: 10)),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.check_circle_outline, color: Colors.green),
                                    title: Text("Sdr. Budi Santoso"),
                                    subtitle: Text("Keterangan Belum Menikah - Kemarin"),
                                    trailing: Chip(label: Text("Selesai"), backgroundColor: Colors.green, labelStyle: TextStyle(color: Colors.white, fontSize: 10)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 30),

            // --- SECTION 3: MENU UTAMA ---
            const Text("Menu Layanan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4, // Default 4 kolom
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.2,
              children: [
                _tombolMenu(context, "Data Warga", Icons.people_alt, Colors.indigo, route: '/warga'),
                _tombolMenu(context, "Surat", Icons.mark_email_read, Colors.blue, route: '/surat'),
                _tombolMenu(context, "Keuangan", Icons.attach_money, Colors.green, route: '/keuangan'),
                _tombolMenu(context, "Posyandu", Icons.baby_changing_station, Colors.pink, route: '/posyandu'),
                _tombolMenu(context, "Kegiatan RW", Icons.event, Colors.purple, route: '/kegiatan'),
                _tombolMenu(context, "Inventaris", Icons.inventory_2, Colors.teal),
                _tombolMenu(context, "Pengumuman", Icons.campaign, Colors.orange),
                _tombolMenu(context, "Pengaturan", Icons.settings, Colors.grey),
              ],
            ),
            const SizedBox(height: 30),
            
            // Footer
            const FooterRW(),
          ],
        ),
      ),
    );
  }

  // WIDGET: Kartu Statistik Ringkas
  Widget _kartuStatistik(String title, String value, IconData icon, Color color, double parentWidth) {
    // Responsif: Jika layar kecil, kartu melebar penuh
    double width = parentWidth > 600 ? 200 : (parentWidth / 2) - 10;
    
    return Container(
      width: width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 5),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    );
  }

  // WIDGET: Tombol Menu
  // WIDGET: Tombol Menu (DIPERBARUI DENGAN KLIK)
  Widget _tombolMenu(BuildContext context, String title, IconData icon, Color color, {String? route}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          if (route != null) {
            // Pindah halaman jika ada rute
            context.push(route);
          } else {
            // Tampilkan pesan jika belum ada fitur
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fitur $title segera hadir!")));
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: color),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// WIDGET KECIL: Legenda Grafik
class _Legend extends StatelessWidget {
  final Color color;
  final String text;
  const _Legend({required this.color, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}