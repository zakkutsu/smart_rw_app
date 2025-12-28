import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/footer_rw.dart';

class HalamanWarga extends StatefulWidget {
  const HalamanWarga({super.key});

  @override
  State<HalamanWarga> createState() => _HalamanWargaState();
}

class _HalamanWargaState extends State<HalamanWarga> {
  // DATA DUMMY (CRUD: Read)
  final List<Map<String, String>> _dataWarga = [
    {"nama": "Budi Santoso", "nik": "3201012002900001", "status": "Warga Tetap", "pekerjaan": "Wiraswasta"},
    {"nama": "Siti Aminah", "nik": "3201015505920002", "status": "Kontrak", "pekerjaan": "Guru"},
    {"nama": "Ahmad Dani", "nik": "3201011001850005", "status": "Warga Tetap", "pekerjaan": "PNS"},
    {"nama": "Ratna Sari", "nik": "3201016002930004", "status": "Kost", "pekerjaan": "Mahasiswa"},
  ];

  // LOGIC: Tambah / Edit Warga
  void _simpanWarga({int? index, required String nama, required String nik, required String status, required String pekerjaan}) {
    setState(() {
      if (index != null) {
        // Mode Edit (Update)
        _dataWarga[index] = {"nama": nama, "nik": nik, "status": status, "pekerjaan": pekerjaan};
      } else {
        // Mode Tambah (Create)
        _dataWarga.insert(0, {"nama": nama, "nik": nik, "status": status, "pekerjaan": pekerjaan});
      }
    });
    Navigator.pop(context); // Tutup dialog
  }

  // LOGIC: Hapus Warga (Delete)
  void _hapusWarga(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Hapus Data?"),
        content: Text("Yakin ingin menghapus data ${_dataWarga[index]['nama']}?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Batal")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              setState(() {
                _dataWarga.removeAt(index);
              });
              Navigator.pop(ctx);
            },
            child: const Text("Hapus"),
          )
        ],
      ),
    );
  }

  // FORM DIALOG (Reusable untuk Tambah & Edit)
  void _showForm({int? index}) {
    final isEdit = index != null;
    final namaCtrl = TextEditingController(text: isEdit ? _dataWarga[index]['nama'] : '');
    final nikCtrl = TextEditingController(text: isEdit ? _dataWarga[index]['nik'] : '');
    final kerjaCtrl = TextEditingController(text: isEdit ? _dataWarga[index]['pekerjaan'] : '');
    String statusPilih = isEdit ? _dataWarga[index]['status']! : 'Warga Tetap';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setStateDialog) => AlertDialog(
          title: Text(isEdit ? "Edit Data Warga" : "Tambah Warga Baru"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: namaCtrl, decoration: const InputDecoration(labelText: "Nama Lengkap")),
                TextField(controller: nikCtrl, decoration: const InputDecoration(labelText: "NIK (16 Digit)"), keyboardType: TextInputType.number),
                TextField(controller: kerjaCtrl, decoration: const InputDecoration(labelText: "Pekerjaan")),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: statusPilih,
                  decoration: const InputDecoration(labelText: "Status Tinggal"),
                  items: ['Warga Tetap', 'Kontrak', 'Kost'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (val) => setStateDialog(() => statusPilih = val!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Batal")),
            ElevatedButton(
              onPressed: () => _simpanWarga(index: index, nama: namaCtrl.text, nik: nikCtrl.text, status: statusPilih, pekerjaan: kerjaCtrl.text),
              child: const Text("Simpan Data"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Data Kependudukan"),
        backgroundColor: Colors.blue[800], // Biru Admin
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // Kembali ke Dashboard
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(),
        label: const Text("Tambah Warga"),
        icon: const Icon(Icons.person_add),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
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
                        final item = _dataWarga[index];
                        return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(item['nama']![0], style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold)),
              ),
              title: Text(item['nama']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIK: ${item['nik']}"),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
                        child: Text(item['status']!, style: const TextStyle(fontSize: 10)),
                      ),
                      const SizedBox(width: 5),
                      Text("• ${item['pekerjaan']}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  )
                ],
              ),
              trailing: PopupMenuButton(
                itemBuilder: (ctx) => [
                  const PopupMenuItem(value: 'edit', child: Row(children: [Icon(Icons.edit, color: Colors.orange), SizedBox(width: 8), Text("Edit")])),
                  const PopupMenuItem(value: 'hapus', child: Row(children: [Icon(Icons.delete, color: Colors.red), SizedBox(width: 8), Text("Hapus")])),
                ],
                onSelected: (value) {
                  if (value == 'edit') _showForm(index: index);
                  if (value == 'hapus') _hapusWarga(index);
                },
              ),
            ),
          );
                      },
                      childCount: _dataWarga.length,
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