import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean/ui/pages/login/login_presenter.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return StreamBuilder<String>(
        stream: presenter.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
                errorText: snapshot.data?.isEmpty == true
                    ? null
                    : snapshot.data,
                labelText: 'Senha',
                icon: Icon(
                  Icons.lock,
                  color:
                  Theme.of(context).primaryColorLight,
                )),
            obscureText: true,
            onChanged: presenter.validatePassword,
          );
        });
  }
}
