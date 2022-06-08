import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_presenter.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();

    return Obx(() => ElevatedButton(
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor),
          onPressed:
              presenter.isFormValid?.value == true ? presenter.auth : null,
          child: Text('Entrar'.toUpperCase()),
        ));
  }
}
