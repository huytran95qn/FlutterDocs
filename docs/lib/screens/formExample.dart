import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormExample extends StatefulWidget {
  @override
  FormExampleState createState() {
    return FormExampleState();
  }
}

class FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();

  String _color = '';
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  Contact newContact = new Contact();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16,bottom: 16),
            child: new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your first and last name',
                labelText: 'Name',
                border: OutlineInputBorder()
              ),
              validator: (val) => val.isEmpty ? 'Name is required' : null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Enter your date of birth',
                labelText: 'Dob',
                border: OutlineInputBorder()
              ),
              validator: (val) => val.isEmpty ? 'Date is required' : null,
              keyboardType: TextInputType.datetime,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.phone,
              validator: (val) => isValidPhoneNumber(val) ? null : 'Phone number must be entered as (###)###-####',
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Enter a email address',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (val) => isValidEmail(val) ? null : 'Please enter a valid email address',
              keyboardType: TextInputType.emailAddress,
            ),
          ),

          new FormField(
            builder: (FormFieldState state) {
              return InputDecorator(
                decoration: InputDecoration(
                  icon: const Icon(Icons.color_lens),
                  labelText: 'Color',
                  border: OutlineInputBorder(),
                  errorText: state.hasError ? state.errorText : null
                ),
                isEmpty: _color == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton(
                    value: _color,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        newContact.favoriteColor = newValue;
                        _color = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _colors.map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
            validator: (val) => val != '' ? null : 'Please select a color',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                } else {
                  setState(() {
                    _autoValidate = true;
                  });
                }
              },
              child: Text('Submit'),
            ),
          ),
          
        ]
      )
    );
  }
}

bool isValidEmail(String input) {
  final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return regex.hasMatch(input);
}

bool isValidPhoneNumber(String input) {
  final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
  return regex.hasMatch(input);
}
  
class Contact {
  String name;
  DateTime dob;
  String phone = '';
  String email = '';
  String favoriteColor = '';
}