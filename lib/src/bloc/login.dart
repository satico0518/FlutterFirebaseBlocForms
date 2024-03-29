import 'dart:async';

import 'package:flutterblockforms/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>(); 
  final _passwordController = BehaviorSubject<String>();


  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get formValidStream => 
    Rx.combineLatest2(emailStream, passwordStream, (emailStrm, passsStrm) => true);
  
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // get latest value
  String get email => _emailController.value;
  String get password => _passwordController.value;
  
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
