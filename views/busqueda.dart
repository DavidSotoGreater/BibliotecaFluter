import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Búsqueda de Personas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List<String> _persons = [];

  void _search() {
    setState(() {
      _persons = [
        'John Doe',
        'Jane Doe',
        'Bob Smith',
        'Alice Johnson',
        'Charlie Brown',
        'David Beckham'
      ]..where((person) => person
          .toLowerCase()
          .contains(_searchController.text.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Búsqueda de Personas'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre a buscar',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _search(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _persons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_persons[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
