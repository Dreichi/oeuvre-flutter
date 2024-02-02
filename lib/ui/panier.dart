// TODO Implement this library.import 'package:oeuvre/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:oeuvre/ui/share/appbar_widget.dart';
import 'package:oeuvre/ui/share/art_style.dart';

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
    appBar: AppBarWidget('Panier', widget._cart),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget._cart.items.length,
            itemBuilder: (context, index) {
              var item = widget._cart.items[index];
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFD4AF37).withOpacity(0.75),
                ),
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage(item.oeuvre.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    item.oeuvre.title,
                    style: AppTheme.headerTitleStyle,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.oeuvre.description, style: AppTheme.headerParagraphStyle),
                      SizedBox(height: 8),
                      Text(
                        '${item.oeuvre.price} €',
                        style: AppTheme.headerTitleStyle,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTheme.headerTitleStyle,
              ),
              Text(
                '${widget._cart.total} €',
                style: AppTheme.headerTitleStyle,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            child: Text('Valider', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            onPressed: () {
              _showConfirmationMessage();
            },
          ),
        ),
      ],
    ),
  );
}
void _showConfirmationMessage() {
  // Affichez le message de confirmation
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Merci pour votre commande !'),
      duration: Duration(seconds: 2),
    ),
  );
}

}
