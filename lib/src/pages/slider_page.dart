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
        child: Column(
            children: <Widget>[
              _crearSlider()
          ],
        ),
      ),
    );
  }
  
  Widget _crearSlider() {

    return Slider(
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
}