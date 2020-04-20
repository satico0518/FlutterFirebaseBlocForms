import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetPage extends StatefulWidget {
  static final String routeName = 'pet';
  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  TextEditingController _inputDateCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _form(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Mi Mascota'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.photo_size_select_actual), onPressed: () {}),
        IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
      ],
    );
  }

  SingleChildScrollView _form() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Form(
            child: Column(
          children: <Widget>[
            _name(),
            SizedBox(height: 10,),
            _birthDate(),
            SizedBox(height: 10,),
            _saveButon()
          ],
        )),
      ),
    );
  }

  Widget _name() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.pets),
          labelText: 'Nombre',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      textCapitalization: TextCapitalization.sentences,
      validator: (value) {
        if (value.length < 5) {
          return 'minimo 5 cart';
        } else {
          return null;
        }
      },
    );
  }

  Widget _birthDate() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      controller: _inputDateCtrl,
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime datetimePicker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().add(-Duration(days: 10950)),
      lastDate: new DateTime.now(),
      locale: Locale('es', 'ES')
    );

    if (datetimePicker != null) {
      setState(() {
        // _date = datetimePicker.toString();
        _inputDateCtrl.text = datetimePicker.toString();
      });
    }
  }

  Widget _saveButon() {
    return RaisedButton.icon(
        icon: Icon(Icons.save),
        label: Text('Guardar'),
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
        onPressed: () {});
  }
}
