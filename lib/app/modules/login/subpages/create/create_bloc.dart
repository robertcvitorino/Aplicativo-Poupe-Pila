import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poupe/app/modules/shared/services/authentication/authentication.dart';
import 'package:rxdart/rxdart.dart';

enum CreateEvent { increment, decrement }

class CreateBloc extends Bloc<CreateEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CreateEvent event) async* {
    switch (event) {
      case CreateEvent.decrement:
        yield state - 1;
        break;
      case CreateEvent.increment:
        yield state + 1;
        break;
    }
  }

  final _authentication =new Authentication();

  final _nameController =BehaviorSubject<String>();
  Observable<String> get nameFlux=>_nameController.stream;
  Sink<String> get nameEvent=>_nameController.sink;
  
  final _emailController =BehaviorSubject<String>();
  Observable<String> get emailFlux=>_emailController.stream;
  Sink<String> get emailEvent=>_emailController.sink;

  final _passwordController =BehaviorSubject<String>();
  Observable<String> get passwordFlux=>_passwordController.stream;
  Sink<String> get passwordEvent=>_passwordController.sink;

  final _confPasswordController =BehaviorSubject<String>();
  Observable<String> get confPasswordFlux=>_confPasswordController.stream;
  Sink<String> get consPasswordEvent=>_confPasswordController.sink;





  onClickLogin() async {
    //await _authentication.createWithEmailAndPassword(_emailController.value ,_passwordController.value);
    print("Nome:     ${_nameController.value}");
    print("Senha:      ${_passwordController.value}");
    print("Confirma senha:    ${_confPasswordController.value}");
    print("Email:      ${_emailController.value}");

    await _authentication.createWithEmailAndPassword(_emailController?.value ,_passwordController?.value).then((firebaseUser){
      Get.offAllNamed('/Home', (Route<dynamic>route)=>false);

    }).catchError((erro){
      print("Erro ao criar Login");
    });

  }

  
 




  dispose(){
    _nameController.close();
    _passwordController.close();
    _confPasswordController.close();
    _emailController.close();
  }








}
