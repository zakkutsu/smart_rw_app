import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/footer_rw.dart';

class HalamanSurat extends StatefulWidget {
  const HalamanSurat({super.key});

  @override
  State<HalamanSurat> createState() => _HalamanSuratState();
}

class _HalamanSuratState extends State<HalamanSurat> {
  // Data Dummy Surat
  final List<Map<String, String>> _listSurat = [
    {"nama": "Budi Santoso", "jenis": "Surat Pengantar SKCK", "tanggal": "20 Des 2025", "status": "Pending"},
    {"nama": "Siti Aminah", "jenis": "Surat Domisili Usaha", "tanggal": "19 Des 2025", "status": "Disetujui"},
    {"nama": "Ahmad Dani", "jenis": "Surat Keterangan Tidak Mampu", "tanggal": "18 Des 2025", "status": "Ditolak"},
  ];

  void _updateStatus(int index, String statusBaru) {
    setState(() {
      _listSurat[index]['status'] = statusBaru;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Status diubah jadi $statusBaru")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layanan Surat"),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(15),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = _listSurat[index];
                        Color warnaStatus = item['status'] == 'Disetujui' ? Colors.green : (item['status'] == 'Pending' ? Colors.orange : Colors.red);
          
                        return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.blue[50], child: const Icon(Icons.email, color: Colors.blue)),
              title: Text(item['jenis']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${item['nama']} • ${item['tanggal']}"),
              trailing: PopupMenuButton(
                child: Chip(
                  label: Text(item['status']!, style: const TextStyle(color: Colors.white, fontSize: 10)),
                  backgroundColor: warnaStatus,
                ),
                itemBuilder: (ctx) => [
                  const PopupMenuItem(value: 'Disetujui', child: Text("Setujui (Acc)")),
                  const PopupMenuItem(value: 'Ditolak', child: Text("Tolak")),
                  const PopupMenuItem(value: 'Pending', child: Text("Pending")),
                ],
                onSelected: (val) => _updateStatus(index, val),
              ),
            ),
          );
                      },
                      childCount: _listSurat.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: const FooterRW(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}