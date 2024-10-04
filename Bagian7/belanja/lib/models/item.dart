enum Rating {
  worst,
  bad,
  ok,
  good,
  recommended,
}

class Item {
  String name;
  int price;
  String imgUrl;
  int stok;
  final Rating rating;

  Item({
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.stok,
    required this.rating,
  });
}
