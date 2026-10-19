import 'package:flutter/material.dart';
import '../main.dart';

class DetailScreen extends StatefulWidget {
  final MenuItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.item.name,
                style: const TextStyle(color: Colors.white, fontSize: 16, shadows: [Shadow(color: Colors.black, blurRadius: 4)]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: Container(
                color: theme.colorScheme.secondaryContainer,
                child: const Center(
                  child: Icon(Icons.fastfood, size: 100, color: Colors.grey),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(widget.item.category),
                        backgroundColor: theme.colorScheme.primaryContainer,
                      ),
                      Text(
                        'Rp ${widget.item.price}',
                        style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Deskripsi Menu', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Nikmati kelezatan ${widget.item.name} yang dimasak dengan bumbu pilihan dan resep rahasia Z Kuy. Cocok dinikmati kapan saja. Dibuat fresh setiap hari khusus untuk Anda pecinta kuliner Nusantara maupun mancanegara.',
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))],
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (_quantity > 1) setState(() => _quantity--);
                      },
                    ),
                    Text('$_quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() => _quantity++),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context, widget.item.price * _quantity);
                  },
                  icon: const Icon(Icons.add_shopping_cart),
                  label: Text('Tambah - Rp ${widget.item.price * _quantity}'),
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}