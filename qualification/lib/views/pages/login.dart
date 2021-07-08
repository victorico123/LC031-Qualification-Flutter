import 'package:flutter/material.dart';
import 'package:qualification/views/pages/home.dart';
import 'package:qualification/utils/global.dart' as gb;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _ctrlUsername = TextEditingController();
  var _ctrlPassword = TextEditingController();
  String _errorMessage = "";
  int _errorField = 0;

  void _onPressed(BuildContext ctx) {
    setState(() {
      if (_ctrlUsername.text.isEmpty) {
        _errorMessage = "Username must be filled!";
        _errorField = 1;
      } else if (_ctrlUsername.text.length < 5) {
        _errorMessage = "Username must be at least 5 characters!";
        _errorField = 1;
      } else if (_ctrlPassword.text.isEmpty) {
        _errorMessage = "Password must be filled!";
        _errorField = 2;
      } else if (_ctrlPassword.text.length < 8) {
        _errorMessage = "Password must be at least 8 characters!";
        _errorField = 2;
      } else if (double.tryParse(_ctrlPassword.text) != null) {
        _errorMessage = "Password must not only contain number!";
        _errorField = 2;
      } else {
        _errorField = 0;
        _errorMessage = "";
        gb.username = _ctrlUsername.text;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (builder) {
            return HomePage();
          }),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.amberAccent, Colors.red]),
            ),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Image(
                        image: AssetImage('assets/icon.jpg'),
                        width: 100,
                        height: 100),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    errorText: _errorField == 1 ? _errorMessage : null,
                  ),
                  controller: _ctrlUsername,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: _errorField == 2 ? _errorMessage : null,
                  ),
                  controller: _ctrlPassword,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton(
                        onPressed: () => _onPressed(context),
                        child: Text('Log In'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          primary: Colors.white,
                          onPrimary: Color(0xfffe67e22),
                        )))
              ],
            ))));
  }
}
