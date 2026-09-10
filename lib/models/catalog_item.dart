class CatalogItem {
  final String name;
  final String price;
  final String description;

  const CatalogItem({
    required this.name,
    required this.price,
    required this.description,
  });
}

// Data dummy 3 item katalog sesuai requirement (Screen 1 harus
// menampilkan 3 cards). Nantinya list ini bisa diganti dengan
// data dari API/database.
final List<CatalogItem> dummyCatalog = [
  CatalogItem(
    name: 'Produk A',
    price: 'Rp 150.000',
    description:
        'Deskripsi singkat mengenai Produk A. Cocok untuk kebutuhan sehari-hari.',
  ),
  CatalogItem(
    name: 'Produk B',
    price: 'Rp 250.000',
    description:
        'Deskripsi singkat mengenai Produk B. Kualitas premium dengan harga terjangkau.',
  ),
  CatalogItem(
    name: 'Produk C',
    price: 'Rp 99.000',
    description:
        'Deskripsi singkat mengenai Produk C. Best seller minggu ini.',
  ),
];
