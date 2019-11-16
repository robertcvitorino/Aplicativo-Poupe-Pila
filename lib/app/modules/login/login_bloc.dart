import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum LoginEvent { increment, decrement }

class LoginBloc extends Bloc<LoginEvent, int> {  
  final BuildContext context;

  LoginBloc({this.context});
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(LoginEvent event) async* {
    switch (event) {
      case LoginEvent.decrement:
        yield state - 1;
        break;
      case LoginEvent.increment:
        yield state + 1;
        break;
    }
  }
  

  var _controllerLoading = BehaviorSubject<bool>();

  Stream<bool> get outLoading =>_controllerLoading.stream;
  





onClickGoogle(){

  print("Acessando Bloc ######");

 
}


   void dispose(){
     _controllerLoading.close();
   }


  




}
