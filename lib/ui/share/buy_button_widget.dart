import 'package:flutter/material.dart';
import 'package:oeuvre/models/cart.dart';
import 'package:oeuvre/models/oeuvre.dart';


class BuyButtonWidget extends StatelessWidget {
  final Oeuvres oeuvre;
  final Cart cart;

  const BuyButtonWidget({
    required this.oeuvre,
    required this.cart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _addToCart();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Oeuvre ajoutée au panier'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Text('Ajouter au panier'),
    );
  }

  void _addToCart() {
    cart.items.add(CartItem(oeuvre));
  }
}