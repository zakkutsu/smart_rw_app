import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/common/footer_rw.dart';

class PosyanduScreen extends StatelessWidget {
  const PosyanduScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Posyandu"),
        backgroundColor: Colors.pink[400],
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  _itemBalita("Aisyah Humaira", "12 Bulan", "8.5 Kg", "Sehat"),
                  _itemBalita("Muhammad Fatih", "24 Bulan", "11 Kg", "Sehat"),
                  _itemBalita("Rizky Billar", "9 Bulan", "7.2 Kg", "Kurang Gizi", warning: true),
                ],
              ),
            ),
            const FooterRW(),
          ],
        ),
      ),
    );
  }

  Widget _itemBalita(String nama, String usia, String berat, String status, {bool warning = false}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(radius: 25, backgroundColor: Colors.pink[100], child: const Icon(Icons.child_care, color: Colors.pink)),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Usia: $usia • Berat: $berat"),
                ],
              ),
            ),
            Chip(
              label: Text(status),
              backgroundColor: warning ? Colors.orange : Colors.green,
              labelStyle: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
