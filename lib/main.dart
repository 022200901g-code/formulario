import 'package:flutter/material.dart';

class LoginData {
  String username = '';
  String password = '';
}

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MainApp> {
  LoginData _loginData = LoginData();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codigo Flutter',
      home: Scaffold(
        appBar: AppBar(title: Text('codigo flutter')),
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Formulario(formKey: _formKey, loginData: _loginData),
        ),
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  const Formulario({
    Key? key,
    required GlobalKey<FormState> formKey,
    required LoginData loginData,
  })  : _formKey = formKey,
        _loginData = loginData,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final LoginData _loginData;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (String? inValue) {
              if (inValue == null || inValue.isEmpty) {
                return 'Introduce nombre de usuario';
              }
              return null;
            },
            onSaved: (String? inValue) {
              _loginData.username = inValue ?? '';
            },
            decoration: InputDecoration(
              hintText: 'none@none.com',
              labelText: 'Usuario (eMail)',
            ),
          ),
          TextFormField(
            obscureText: true,
            validator: (String? inValue) {
              if (inValue == null || inValue.length < 10) {
                return 'la contraseña debe tener al menos 10 caracteres';
              }
              return null;
            },
            onSaved: (String? inValue) {
              _loginData.password = inValue ?? '';
            },
            decoration: InputDecoration(
              hintText: 'contraseña',
              labelText: 'Contraseña',
            ),
          ),
          ElevatedButton(
            child: Text('acceso'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print('Usuario: ${_loginData.username}');
                print('Contraseña: ${_loginData.password}');
              }
            },
          ),
        ],
      ),
    );
  }
}
