import 'package:belanja/models/item.dart';

List<Item> dummyItems = [
  Item(
    name: "Garam",
    price: 5000,
    imgUrl: "https://kledo.com/blog/wp-content/uploads/2020/06/sembako-murah-1536x1152.jpg", // Gambar placeholder
    stok: 50,
    rating: Rating.good,
  ),
  Item(
    name: "Minyak Goreng",
    price: 20000,
    imgUrl: "https://kledo.com/blog/wp-content/uploads/2020/06/sembako-murah-1536x1152.jpg", // Gambar placeholder
    stok: 30,
    rating: Rating.ok,
  ),
  Item(
    name: "Telur",
    price: 30000,
    imgUrl: "https://kledo.com/blog/wp-content/uploads/2020/06/sembako-murah-1536x1152.jpg", // Gambar placeholder
    stok: 20,
    rating: Rating.recommended,
  ),
  Item(
    name: "Beras",
    price: 15000,
    imgUrl: "https://kledo.com/blog/wp-content/uploads/2020/06/sembako-murah-1536x1152.jpg", // Gambar placeholder
    stok: 0,
    rating: Rating.bad,
  ),
  Item(
    name: "Rokok",
    price: 25000,
    imgUrl: "https://kledo.com/blog/wp-content/uploads/2020/06/sembako-murah-1536x1152.jpg", // Gambar placeholder
    stok: 100,
    rating: Rating.worst,
  ),
];
