import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';

  List<String> _powers = ['volar', 'Rayos X', 'Super Aliento', 'Super fuerza'];
  String _optionSelected = 'volar';

  TextEditingController _inputDateFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropDown(),
            Divider(),
            _crearPersona(),
          ]),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_optionSelected),
    );
  }

  Widget _crearEmail() {
    return TextField(
        // autofocus: true,
        // textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          // counter: Text('Letras ${_nombre.length}'),
          hintText: 'Email',
          labelText: 'Email',
          // helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        // autofocus: true,
        // textCapitalization: TextCapitalization.words,
        // keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          // counter: Text('Letras ${_nombre.length}'),
          hintText: 'Password',
          labelText: 'Password',
          // helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
        ),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateFieldController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        // counter: Text('Letras ${_nombre.length}'),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        // helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.perm_contact_cal),
        icon: Icon(Icons.date_range),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputDateFieldController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = [];

    _powers.forEach((power) {
      lista.add(DropdownMenuItem(
        child: Text(power),
        value: power
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: this._optionSelected,
            items: getOpcionesDropDown(),
            onChanged: (option) {
              setState(() {
                this._optionSelected = option;
              });
            },
          ),
        )
      ],
    );

  }

}
