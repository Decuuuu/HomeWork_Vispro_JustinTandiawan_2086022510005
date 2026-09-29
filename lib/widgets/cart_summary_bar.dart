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
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.orange.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$totalItems Item | Rp $totalPrice',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: totalItems == 0 ? null : () {},
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}