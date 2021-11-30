import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean/ui/components/headline1.dart';
import '../components/login_header.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LoginHeader(),
            Headline1(text: 'Login',),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColorLight,
                          )),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            icon: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColorLight,
                            )),
                        obscureText: true,
                      ),
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () {},
                      child: Text('Entrar'.toUpperCase()),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      label: Text('Criar Conta'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


