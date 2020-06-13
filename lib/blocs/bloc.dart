import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _telpController = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<String> get telp => _telpController.stream.transform(validateTelp);

  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  // change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeTelp => _telpController.sink.add;

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    final validTelp = _passwordController.value;

    print('Email is $validEmail, password is $validPassword, telp is $validTelp');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
    _telpController.close();
  }
}