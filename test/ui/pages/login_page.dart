import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tdd_clean/ui/pages/pages.dart';
import 'package:mockito/mockito.dart';

class LoginPresenterSpy extends Mock implements LoginPresenter {}

void main() {
  LoginPresenter presenter;
  StreamController<String> emailErrorController;
  StreamController<String> passwordErrorController;

  Future loadPage(WidgetTester tester) async {
    presenter = LoginPresenterSpy();
    emailErrorController = StreamController<String>();
    passwordErrorController = StreamController<String>();
    when(presenter.emailErrorStream)
        .thenAnswer((realInvocation) => emailErrorController.stream);
    when(presenter.passwordErrorStream).thenAnswer((realInvocation) => passwordErrorController.stream);
    final loginPage = MaterialApp(home: LoginPage(presenter));
    await tester.pumpWidget(loginPage);
  }

  tearDown(() {
    emailErrorController.close();
    passwordErrorController.close();
  });

  testWidgets("Should load with correct initial states",
      (WidgetTester tester) async {
    await loadPage(tester);

    final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'), matching: find.byType(Text));
    expect(emailTextChildren, findsOneWidget);

    final passwordTextChildren = find.descendant(
        of: find.bySemanticsLabel('Senha'), matching: find.byType(Text));
    expect(passwordTextChildren, findsOneWidget);

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, null);
  });

  testWidgets("Should call validate with correct values",
      (WidgetTester tester) async {
        await loadPage(tester);

        final email = faker.internet.email();
        await tester.enterText(find.bySemanticsLabel('Email'), email);
        verify(presenter.validateEmail(email));

        final password = faker.internet.password();
        await tester.enterText(find.bySemanticsLabel('Senha'), password);
        verify(presenter.validatePassword(password));
  });

  testWidgets('should present error if email is invalid',
      (WidgetTester tester) async {
    await loadPage(tester);

    emailErrorController.add('any error');
    await tester.pump();

    expect(find.text('any error'), findsOneWidget);
  });

  testWidgets('should present error if email is valid',
      (WidgetTester tester) async {
    await loadPage(tester);

    emailErrorController.add(null);
    await tester.pump();

    expect(find.descendant(
        of: find.bySemanticsLabel('Email'), matching: find.byType(Text)), findsOneWidget);
  });

  testWidgets('should present no error if email is valid',
          (WidgetTester tester) async {
        await loadPage(tester);

        emailErrorController.add('');
        await tester.pump();

        expect(find.descendant(
            of: find.bySemanticsLabel('Email'), matching: find.byType(Text)), findsOneWidget);
      });

  testWidgets('should present error if password is invalid',
          (WidgetTester tester) async {
        await loadPage(tester);

        passwordErrorController.add('any error');
        await tester.pump();

        expect(find.text('any error'), findsOneWidget);
      });

  testWidgets('should present error if password is valid',
          (WidgetTester tester) async {
        await loadPage(tester);

        passwordErrorController.add(null);
        await tester.pump();

        expect(find.descendant(
            of: find.bySemanticsLabel('Email'), matching: find.byType(Text)), findsOneWidget);
      });

  testWidgets('should present no error if password is valid',
          (WidgetTester tester) async {
        await loadPage(tester);

        passwordErrorController.add('');
        await tester.pump();

        expect(find.descendant(
            of: find.bySemanticsLabel('Senha'), matching: find.byType(Text)), findsOneWidget);
      });
}
