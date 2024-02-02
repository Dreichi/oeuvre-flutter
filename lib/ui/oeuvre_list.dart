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
        // Titre centré avec margin bottom
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text(oeuvre.title, style: AppTheme.headerTitleStyle),
          ),
        ),
        // Image dans un conteneur avec background color et border radius
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD4AF37),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(
            oeuvre.image, // Assurez-vous d'avoir l'URL correcte de l'image
            width: 350, // Ajustez la largeur selon vos besoins
            height: 450, // Ajustez la hauteur selon vos besoins
          ),
        ),
        // Margin bottom pour l'image
        Container(
          margin: EdgeInsets.only(bottom: 16),
        ),
        // Description avec margin bottom
        Text(oeuvre.description, style: AppTheme.headerParagraphStyle, textAlign: TextAlign.justify),
        Container(
          margin: EdgeInsets.only(bottom: 16),
        ),
        // Prix avec taille de police spécifiée
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${oeuvre.price.toString()} €', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            // Margin right pour le bouton
            Container(
              margin: EdgeInsets.only(right: 16),
              child: BuyButtonWidget(oeuvre: oeuvre, cart: _cart),
            ),
          ],
        ),
      ],
    ),
  );
}


}
