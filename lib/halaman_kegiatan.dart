import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HalamanKegiatan extends StatelessWidget {
  const HalamanKegiatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agenda Kegiatan RW"),
        backgroundColor: Colors.purple[700],
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _itemEvent("Kerja Bakti Masal", "Minggu, 24 Des 2025", "07:00 WIB", "Lapangan RW", true),
          _itemEvent("Rapat Akhir Tahun", "Sabtu, 30 Des 2025", "19:30 WIB", "Balai Warga", true),
          _itemEvent("Posyandu Bulanan", "Senin, 02 Jan 2026", "08:00 WIB", "Pos Kesehatan", false),
        ],
      ),
    );
  }

  Widget _itemEvent(String nama, String tgl, String jam, String lokasi, bool isUpcoming) {
    return Card(
      color: isUpcoming ? Colors.white : Colors.grey[200],
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isUpcoming ? Colors.purple[50] : Colors.grey[300],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10))
            ),
            child: Text(tgl, style: TextStyle(fontWeight: FontWeight.bold, color: isUpcoming ? Colors.purple : Colors.grey[700])),
          ),
          ListTile(
            title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(children: [const Icon(Icons.access_time, size: 16), const SizedBox(width: 5), Text(jam)]),
                Row(children: [const Icon(Icons.location_on, size: 16), const SizedBox(width: 5), Text(lokasi)]),
              ],
            ),
            trailing: isUpcoming 
              ? ElevatedButton(onPressed: (){}, child: const Text("Hadir"))
              : const Text("Selesai", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}