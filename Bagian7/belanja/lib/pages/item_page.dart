import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemArgs =
        GoRouterState.of(context).extra as Item; // Mengambil item dari GoRouter
    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              // Jika tidak bisa pop, misalnya halaman root, bisa ganti ke route home atau yang lain
              context.go('/');
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ItemImage(
                        imgUrl: itemArgs.imgUrl,
                      );
                    },
                  ),
                );
              },
              child: Hero(
                tag: 'Foto',
                child: Image.network(
                  itemArgs.imgUrl,
                ),
              ),
            ),
            Text("Price Rp.${itemArgs.price.toString()}"),
            Text("Availability ${itemArgs.stok.toString()}"),
            Text("Rating ${itemArgs.rating.toString()}"),
          ],
        ),
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'Foto',
            child: Image.network(
              imgUrl,
            ),
          ),
        ),
      ),
    );
  }
}
