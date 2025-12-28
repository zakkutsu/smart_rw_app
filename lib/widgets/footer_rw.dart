import 'package:flutter/material.dart';

class FooterRW extends StatelessWidget {
  const FooterRW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Informasi RW
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.white70, size: 16),
              const SizedBox(width: 5),
              Text(
                "RW 05, Kelurahan Contoh, Kecamatan Contoh, Kota Bandung",
                style: TextStyle(color: Colors.white70, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Kontak
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.white70, size: 16),
              const SizedBox(width: 5),
              Text(
                "0812-3456-7890",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(width: 15),
              Icon(Icons.email, color: Colors.white70, size: 16),
              const SizedBox(width: 5),
              Text(
                "rw05@gmail.com",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Divider
          Divider(color: Colors.white30, thickness: 1),
          const SizedBox(height: 8),
          
          // Copyright
          Text(
            "© 2025 Smart RW Dashboard - Sistem Informasi RW 05",
            style: TextStyle(color: Colors.white60, fontSize: 11),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            "Dibuat dengan ❤️ untuk kemudahan pelayanan warga",
            style: TextStyle(color: Colors.white60, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
