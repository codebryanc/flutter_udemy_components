import 'package:flutter/services.dart' show rootBundle; // => Asi solo nos queda visible el package que necesitamos

import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  // change this => 
  // void cargarData() { // TO => 

  // Un Future en segundos despues, retorna una la información dentro del metodo.

  Future<List<dynamic>> cargarData() async { // El Future builder permite que se ejecute codigo, posterior a su ejecución.
    // Whit async this code change 
    // rootBundle.loadString('data/menu_opts.json')
    //   .then( (data) {
    //    Map dataMap = json.decode(data); // Whit this the information change to JSON
    //    print(dataMap['rutas']);

    //    opciones = dataMap['rutas'];
    //   });

    final result = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(result); // Whit this the information change to JSON
    opciones = dataMap['rutas'];

    return opciones;
  }
}

// Singleton => solo una instancia
final menuProvider = new _MenuProvider();
