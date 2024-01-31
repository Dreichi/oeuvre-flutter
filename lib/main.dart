// main.dart
import 'package:flutter/material.dart';
import 'package:oeuvre/models/cart.dart';
import 'package:oeuvre/models/oeuvre.dart';
import 'package:oeuvre/models/oeuvre_data.dart';
import 'package:oeuvre/ui/oeuvre_list.dart';
import 'package:oeuvre/ui/share/appbar_widget.dart';
import 'package:oeuvre/ui/share/art_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art by Chiara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Art by Chiara'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  Cart _cart;

  MyHomePage({required this.title, Key? key}) : _cart = Cart(), super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Oeuvres> _oeuvres = [];

  @override
  void initState() {
    super.initState();
    _loadOeuvres();
  }

  void _loadOeuvres() async {
    List<Oeuvres> oeuvres = await OeuvreData.buildList();
    setState(() {
      _oeuvres = oeuvres;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(widget.title, widget._cart),
      body: Center(
        child: _oeuvres.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: _oeuvres.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OeuvreList(oeuvre: _oeuvres[index]), // Pass selected oeuvre
                ),
              );
            },
            child: _buildRow(_oeuvres[index], context),
          ),
        ),
      ),
    );
  }
}

_buildRow(Oeuvres oeuvre, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFFD4AF37),
    ),
    margin: EdgeInsets.all(14),
    padding: EdgeInsets.all(14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(oeuvre.title, style: AppTheme.headerTitleStyle, textAlign: TextAlign.center),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(oeuvre.image, fit: BoxFit.contain, height: 150),
            ),
            Expanded(
              flex: 3,
              child: Text(oeuvre.description, style: AppTheme.headerParagraphStyle),
            ),
          ],
        ),
      ],
    ),
  );
}
