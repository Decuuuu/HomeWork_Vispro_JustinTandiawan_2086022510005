import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MakanKuy!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimary)),
          const SizedBox(height: 4),
          Expanded(
            flex: 0,
            child: Text(
              'Mau pesan apa hari ini? Cabang Perintis siap melayani 24 Jam nonstop.',
              style: TextStyle(color: theme.colorScheme.onPrimary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}