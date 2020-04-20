import 'package:flutter/material.dart';
import 'package:flutterblockforms/src/bloc/provider.dart';
import 'package:flutterblockforms/src/pages/home.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_getBackground(context), _loginForm(context)],
      ),
    );
  }

  Widget _getBackground(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _background = Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ])),
    );

    Widget _dog(double top, double left) {
      return Positioned(
        top: top,
        left: left,
        child: Container(
          width: 100,
          height: 100,
          child: Opacity(
            opacity: 0.1,
            child: Image(
              image: AssetImage('assets/images/dog-white.png'),
            ),
          ),
        ),
      );
    }

    final _logo = Positioned(
        top: 100,
        left: (size.width / 2) - 80,
        child: Column(
          children: <Widget>[
            Container(
              child: Image(
                  width: 150, image: AssetImage('assets/images/dogcat.png')),
            ),
            Text(
              "Pet App",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));

    return Stack(
      children: <Widget>[_background, _dog(200, 20), _dog(50, 300), _logo],
    );
  }

  _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 250,
          )),
          Container(
            padding: EdgeInsets.all(20),
            width: size.width * .8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                      spreadRadius: 2)
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  "Ingreso",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                _emailInput(bloc),
                SizedBox(
                  height: 20,
                ),
                _passInput(bloc),
                SizedBox(
                  height: 20,
                ),
                _submitbutton(context, bloc)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('recordar mi contraseña',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  color: Color.fromRGBO(63, 63, 156, 1)))
        ],
      ),
    );
  }

  Widget _emailInput(LoginBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.alternate_email,
                    color: Color.fromRGBO(63, 63, 156, 1),
                  ),
                  hintText: 'ejemplo@correo.com',
                  helperText: snapshot.data,
                  labelText: 'Usuario',
                  errorText: snapshot.error),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  Widget _passInput(LoginBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Container(
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Color.fromRGBO(63, 63, 156, 1),
                  ),
                  labelText: 'Contraseña',
                  counterText: '${snapshot.data?.length ?? 0} caracteres',
                  errorText: snapshot.error),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  Widget _submitbutton(BuildContext context, LoginBloc bloc) {
    return StreamBuilder<bool>(
      stream: bloc.formValidStream,
      builder: (context, snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Color.fromRGBO(63, 63, 156, 1),
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(context, bloc) : null
      );
    });
  }

  _login(BuildContext context, LoginBloc bloc) {
    print('***************************');
    print('email: ${bloc.email}');
    print('pass: ${bloc.password}');
    print('***************************');
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
