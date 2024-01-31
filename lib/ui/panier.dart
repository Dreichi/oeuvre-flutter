// TODO Implement this library.import 'package:oeuvre/models/cart.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';


class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: widget._cart.items.map((item) => ListTile(
                title: Text(item.oeuvre.title),
                subtitle: Text('${item.oeuvre.price} �'),
              )).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text('${widget._cart.total} �'),
            ],
          ),
          Container(
            child: ElevatedButton(
              child: Text('Valider'),
              onPressed: () {
                print('Valider');
              },
            ),
          ),
        ],
      ),
    );
  }
}
