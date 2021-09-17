import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
            children: <Widget>[
              _crearSlider(),
              Expanded(
                child: _crearImagen()
              ),
          ],
        ),
      ),
    );
  }
  
  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      min: 10.0,
      max: 400.0,
      value: _sliderValue,
      onChanged: (double newValue) {
        setState(() {
          _sliderValue = newValue;
        });
      },
    );

  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://d3ugyf2ht6aenh.cloudfront.net/stores/892/541/products/batman-original21-0e373dd8328585fdb615411809339523-640-0.jpg"),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }
}