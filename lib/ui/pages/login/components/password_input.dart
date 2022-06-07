import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean/ui/pages/login/login_presenter.dart';
import 'package:get/get.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();

    return Obx(() => TextFormField(
          decoration: InputDecoration(
              errorText: presenter.passwordError?.value?.isEmpty == true
                  ? null
                  : presenter.passwordError.value,
              labelText: 'Senha',
              icon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColorLight,
              )),
          obscureText: true,
          onChanged: presenter.validatePassword,
        ));
  }
}
