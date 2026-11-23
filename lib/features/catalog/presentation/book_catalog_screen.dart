import 'package:flutter/material.dart';

class BookCatalogScreen extends StatelessWidget {
  const BookCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Catalog')),
      body: const Center(
        child: Text('Book Catalog & AI Helper (Screen 3)'),
      ),
    );
  }
}
