import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _numbers = [];
  int _lastNumber = 0;
  bool _isLoading = false;
  
  @override
  void initState() {
    // Clase state y la inicializa! 
    super.initState();

    _agregarDiez();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // Llegue al final de la pagina
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Para prevenir fugas de memoria
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _numbers.length,
      itemBuilder: (BuildContext context, int index) {
        
        final imagen = _numbers[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  void _agregarDiez() {
    for (var i = 0; i < 10; i++) {
      // Aumento ++
      _lastNumber++;
      _numbers.add(_lastNumber);
    }

    setState(() {
      
    });
  }

  Future<Null> _fetchData() async {
    // Le digo a Flutter que se debe redibujar por qué esa propiedad cambio
    setState(() {
      _isLoading = true;
    });

    final duration = new Duration(seconds: 2); // => Pasan estos 2 segundos pero el usuario no sabe que sucede

    return new Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200)
    );

    _agregarDiez();
  }

  // Siempre debemos devolver algo
  Widget _crearLoading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                color: Colors.white,
              )
            ]
          ),
          SizedBox(height: 15.0),
        ]
      );
    }
    else {
      // Devolvemos un contenedor vacío
      return Container();
    }
  }
}