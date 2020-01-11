import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

const midImage = "assets/images/KTMLabs.svg";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KTM LABS'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(midImage),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please type an email';
                    }
                    return null;
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Your password need to be atleast 6 characters';
                    }
                    return null;
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.emailAddress,
                  
                  
                ),
                RaisedButton(
                  onPressed: logIn,
                  child: Text('Log in'),
                ),
              ],
            )));
  }

  Future<void> logIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        final FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.push(context, MaterialPageRoute(builder: (contex) => Home(user:user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
