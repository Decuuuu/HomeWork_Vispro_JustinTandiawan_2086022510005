import 'package:flutter/material.dart';

class CartSummaryBar extends StatelessWidget {
  final int totalItems;
  final int totalPrice;
  final VoidCallback? onOrder;

  const CartSummaryBar({
    super.key,
    required this.totalItems,
    required this.totalPrice,
    this.onOrder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total ($totalItems item)', style: theme.textTheme.bodyMedium, maxLines: 1),
                  Text(
                    'Rp $totalPrice',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            FilledButton.icon(
              key: const Key('order-button'),
              // JIKA total item 0, tombol mati. Jika ada, jalankan onOrder
              onPressed: totalItems == 0 ? null : onOrder,
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text('Pesan', style: TextStyle(fontSize: 16)),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}