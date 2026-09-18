import 'package:flutter/material.dart';
import '../models/catalog_item.dart';

/// Screen 2 (Detail Katalog)
/// - Wajib StatefulWidget (tantangan tambahan: ada state interaktif)
/// - Layout dasar pakai Column
/// - Ada Icon back untuk kembali ke Screen 1
/// - Ada Text untuk nama katalog/harga
/// - Ada Container dengan latar belakang pastel + padding untuk deskripsi
class DetailScreen extends StatefulWidget {
  final CatalogItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Contoh state interaktif sederhana: toggle status favorit
  // saat tombol ditekan (memenuhi requirement "perubahan state
  // interaktif pada tombol dengan mengubah Screen 2 menjadi StatefulWidget").
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(
        // AppBar otomatis menampilkan tombol back bawaan,
        // tapi kita tetap tambahkan Icon back eksplisit di leading
        // sesuai requirement "Elemen Visual Screen 2".
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail Katalog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama katalog
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Harga
            Text(
              item.price,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // Container pastel berisi deskripsi singkat/bio
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE6E6FA), // ungu pastel
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item.description,
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol dengan state interaktif (StatefulWidget)
            Center(
              child: ElevatedButton.icon(
                onPressed: _toggleFavorite,
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : null,
                ),
                label: Text(_isFavorite ? 'Difavoritkan' : 'Tambah Favorit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
