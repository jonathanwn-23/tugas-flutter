import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Harga Layanan IT',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: const Center(
          child: PricingCard(),
        ),
      ),
    ); 
  }
}

class PricingCard extends StatelessWidget {
  const PricingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 1. LAYER DASAR (Pembungkus Utama)
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        // 2. BADGE MELAYANG (Stack + Positioned)
        clipBehavior: Clip.none,
        children: [
          // ---- Elemen utama kartu (layer bawah) ----
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3. HEADER PAKET (Column)
              const Icon(
                Icons.laptop_mac,
                size: 48,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 12),
              const Text(
                'Paket Profesional',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Solusi lengkap untuk kebutuhan bisnis Anda',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),

              // 4. HARGA & DURASI (Row + baseline alignment)
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    'Rp 5.000.000',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/ proyek',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 5. DAFTAR FITUR LAYANAN (Column berisi Row)
              const FeatureItem(text: 'Desain UI/UX Khusus'),
              const SizedBox(height: 10),
              const FeatureItem(text: 'Setup Database'),
              const SizedBox(height: 10),
              const FeatureItem(text: 'Konsultasi 24/7'),
              const SizedBox(height: 10),
              const FeatureItem(text: 'Free 1x Revisi Besar'),
              const SizedBox(height: 24),

              // 6. TOMBOL CALL-TO-ACTION (full width)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Pilih Paket',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          // ---- Badge "Rekomendasi" (melayang di pojok kanan atas) ----
          Positioned(
            top: -10,
            right: -10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                'Rekomendasi',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget kecil untuk satu baris fitur (ikon centang + teks)
class FeatureItem extends StatelessWidget {
  final String text;
  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, size: 18, color: Colors.green),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}