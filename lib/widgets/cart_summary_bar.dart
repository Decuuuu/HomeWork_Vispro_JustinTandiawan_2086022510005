import 'package:flutter/material.dart';

class CartSummaryBar extends StatelessWidget {
  const CartSummaryBar({
    super.key,
    required this.totalItems,
    required this.totalPrice,
  });

  final int totalItems;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // SafeArea wajib ada untuk menahan Gesture Bar bawah (Syarat Bonus)
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
              key: const Key('order-button'), // Wajib ada untuk Test No. 8 & Bonus
              onPressed: totalItems == 0 ? null : () {},
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