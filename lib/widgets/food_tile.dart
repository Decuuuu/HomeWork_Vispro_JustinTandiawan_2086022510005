import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/detail_screen.dart';

class FoodTile extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const FoodTile({super.key, required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(item: item)),
          );
        },
        child: ListTile(
          title: Text(
            item.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text('Rp ${item.price} • ${item.category}'),
          trailing: IconButton(
            icon: const Icon(Icons.add_circle, color: Color(0xFFA55A46)),
            onPressed: onAdd,
          ),
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const MenuTile({super.key, required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(item: item)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('Rp ${item.price}', style: const TextStyle(color: Color(0xFFA55A46), fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: onAdd,
                  child: const Text('Tambah'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}