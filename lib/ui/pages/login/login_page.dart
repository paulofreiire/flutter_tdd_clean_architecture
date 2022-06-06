import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import 'login_presenter.dart';
import 'components/components.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage(this.presenter);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        widget.presenter.isLoadingStream.listen((isLoading) {
          if (isLoading)
            showLoading(context);
          else
            hideLoading(context);
        });

        widget.presenter.mainErrorStream.listen((error) {
          if (error != null) showErrorMessage(context, error);
        });

        return GestureDetector(
          onTap: _hideKeyboard,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                LoginHeader(),
                Headline1(
                  text: 'Login',
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Provider(
                    create: (_) => widget.presenter,
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          EmailInput(),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 32),
                            child: PasswordInput(),
                          ),
                          LoginButton(),
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
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }
}
