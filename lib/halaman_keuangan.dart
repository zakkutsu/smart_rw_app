import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'widgets/footer_rw.dart';

class HalamanKeuangan extends StatelessWidget {
  const HalamanKeuangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Kas RW"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {}, 
        label: const Text("Catat Kas"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          // Saldo Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            color: Colors.green[50],
            child: Column(
              children: [
                const Text("Total Saldo Kas RW 05", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                Text("Rp 15.250.000", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green[800])),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_upward, color: Colors.green, size: 16), Text(" Pemasukan: Rp 2jt  ", style: TextStyle(color: Colors.green)),
                    Icon(Icons.arrow_downward, color: Colors.red, size: 16), Text(" Pengeluaran: Rp 500rb", style: TextStyle(color: Colors.red)),
                  ],
                )
              ],
            ),
          ),
          // List Transaksi
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _itemKas("Iuran Warga RT 01", "20 Des 2025", "+ Rp 1.500.000", true),
                      _itemKas("Perbaikan Lampu Jalan", "18 Des 2025", "- Rp 350.000", false),
                      _itemKas("Konsumsi Rapat RW", "15 Des 2025", "- Rp 150.000", false),
                      _itemKas("Donasi Hamba Allah", "10 Des 2025", "+ Rp 500.000", true),
                    ],
                  ),
                  const FooterRW(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemKas(String judul, String tgl, String nominal, bool masuk) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: masuk ? Colors.green[100] : Colors.red[100],
          child: Icon(masuk ? Icons.arrow_downward : Icons.arrow_upward, color: masuk ? Colors.green : Colors.red),
        ),
        title: Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(tgl),
        trailing: Text(nominal, style: TextStyle(color: masuk ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}