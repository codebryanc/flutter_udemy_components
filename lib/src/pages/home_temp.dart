import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    // For test
    //return Center(child: Text("Home Temp"));
    return Scaffold(
      appBar: AppBar(
        title: Text("Components temp"),
      ),
      body: ListView(
          children: //_crearItems(),
              _crearItemsCorto()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opcion in opciones) {
      final tempWidget = ListTile(
        title: Text(opcion),
      );

      // => Es lo mismo versión 01
      // lista.add(tempWidget);
      // lista.add(Divider());

      // => Es lo mismo versión 02
      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto() {
    // List<Widget> widgets = new List<Widget>();

    var widgets = opciones.map((opcion) {
      return Column(
        children: [
          ListTile(
            title: Text(opcion + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }
}
