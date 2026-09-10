import 'package:flutter/material.dart';
import '../../models/catalog_item.dart';
import 'detail_screen.dart';

/// Screen 1 (Beranda/Katalog)
/// - Wajib StatelessWidget
/// - Menampilkan ListView berisi 3 cards
/// - Setiap item pakai ListTile yang bisa diklik
/// - Klik item -> Navigator.push ke Screen 2
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyCatalog.length,
        itemBuilder: (context, index) {
          final item = dummyCatalog[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const CircleAvatar(
                child: Icon(Icons.shopping_bag_outlined),
              ),
              title: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item.price),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigasi Screen 1 -> Screen 2 pakai Stack Navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
