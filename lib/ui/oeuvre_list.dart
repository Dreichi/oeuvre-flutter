// oeuvre_list.dart
import 'package:flutter/material.dart';
import 'package:oeuvre/models/cart.dart';
import 'package:oeuvre/models/oeuvre.dart';
import 'package:oeuvre/ui/share/appbar_widget.dart';
import 'package:oeuvre/ui/share/art_style.dart';
import 'package:oeuvre/ui/share/buy_button_widget.dart';

class OeuvreList extends StatelessWidget {
  final Oeuvres oeuvre;
  Cart _cart;


  OeuvreList({required this.oeuvre, Key? key}) :
   _cart = Cart(),
   super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("Détails de l'oeuvre", _cart),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOeuvreDetails(oeuvre, context),
          ],
        ),
      ),
    );
  }

  Widget _buildOeuvreDetails(Oeuvres oeuvre, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(oeuvre.title, style: AppTheme.headerTitleStyle),
          Text(oeuvre.description, style: AppTheme.headerParagraphStyle),
          Text(oeuvre.price.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          BuyButtonWidget(oeuvre: oeuvre, cart: _cart),
        ],
      ),
    );
  }
}
