import 'package:flutter/material.dart';

import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icono_string_util.dart';
import 'package:flutter_components/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _lista());
  }

  Widget _lista() {
    
    // For validate if the information 'opciones' is already loaded!
    // menuProvider.cargarData().then((listItems) {
    //   print('_lista widget in home_page.dart');
    //   print(listItems);
    // });

    // Estados de un Future Builder =>
    // Pidiendo información, Cuando se resuelve, Cuando hay un error.

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], // This argument is optional
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        // For know the information is loading!
        // print('builder');

        // if(snapshot.hasData) {
        //   // (Data obtenida) For know what is the data!
        //   print(snapshot.data);

        // For construct this widget
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
        // }
        // else if(snapshot.hasError) {
        //   // (Error obtenido) For view the error in menu_provider.dart component
        //   print(snapshot.error);
        // }
        // else {
        //   // (Pidiendo data) When the information its not loaded yet / or loading
        //   print('Loading information');
        // }
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    // return [ListTile(title: Text('Hola mundo')), Divider(), ListTile(title: Text('Hola mundo')), Divider(), ListTile(title: Text('Hola mundo'))];

    final List<Widget> options = [];

    if(data == null) {
      return [];
    }

    data.forEach((option) {
      final widgetTemp = ListTile(
        title: Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          // i want navigate to other pages
          
          // final route = MaterialPageRoute(
          //   builder: (context) {
          //     if(option['ruta'] == 'alert') {
          //       return AlertPage();
          //     }
          //     else if(option['ruta'] == 'avatar') {
          //       return AvatarPage();
          //     }
          //     else {
          //       return null;
          //     }
          //   }
          // );

          // Navigator.push(context, route);

          Navigator.pushNamed(context, option['ruta']);

        },
      );
      
      options..add(widgetTemp)
             ..add(Divider());
    });

    return options;
  }
}
