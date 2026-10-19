import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final int totalItems;
  final int totalPrice;

  const CheckoutScreen({super.key, required this.totalItems, required this.totalPrice});

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 80),
                const SizedBox(height: 16),
                Text('Pesanan Berhasil!', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Makananmu sedang disiapkan oleh tim Makan Z Kuy.', textAlign: TextAlign.center),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context); // Tutup BottomSheet
                      Navigator.pop(context, true); // Kembali ke Layar Utama & Reset Cart
                    },
                    child: const Text('Kembali ke Beranda'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text('Ringkasan Pesanan', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Item', style: theme.textTheme.bodyLarge),
                        Text('$totalItems Item', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: theme.textTheme.bodyLarge),
                        Text('Rp $totalPrice', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pajak PPN (11%)', style: theme.textTheme.bodyLarge),
                        Text('Rp ${(totalPrice * 0.11).toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: theme.colorScheme.surface, boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total Pembayaran'),
                  Text(
                    'Rp ${(totalPrice * 1.11).toInt()}', // Total + PPN
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
                  ),
                ],
              ),
              FilledButton.icon(
                onPressed: () => _showSuccessBottomSheet(context),
                icon: const Icon(Icons.payment),
                label: const Text('Bayar Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}