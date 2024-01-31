import 'package:oeuvre/models/oeuvre.dart';

class CartItem {
  final Oeuvres oeuvre;

  CartItem(this.oeuvre);
}

class Cart {
  final List<CartItem> items = [];

  double get total {
    return items.fold(0, (total, item) => total + item.oeuvre.price);
  }
}
