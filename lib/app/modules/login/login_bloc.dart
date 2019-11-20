import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poupe/app/modules/router/routers.dart';
import 'package:poupe/app/modules/shared/services/authentication/authentication.dart';
import 'package:rxdart/rxdart.dart';

enum LoginEvent { increment, decrement }

class LoginBloc extends Bloc<LoginEvent, int> {   

  
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
  final _authencation =new Authentication();

  var _controllerLoading = BehaviorSubject<bool>();
  Stream<bool> get outLoading =>_controllerLoading.stream;
  
  final BehaviorSubject<String> _emailController =  BehaviorSubject<String>();
  Observable<String> get emailUser=> _emailController.stream;
  Sink<String> get emailEvent =>_emailController.sink;
  
  final BehaviorSubject<String> _passwordController = new BehaviorSubject<String>();
  Observable<String> get passwordUser=> _passwordController.stream;
  Sink<String> get passwordEvent =>_passwordController.sink;

   var _controllerVazio = BehaviorSubject<String>();
  Stream<String> get outVazio => _controllerVazio.stream;
  

onClickLogin()async
{
  /*
  if(await _authencation.signWithEmailAndPassword(_emailController.value,_passwordController.value))
  {
     print("Login realizado ");   

    _controllerLoading.add(true);
  
    /*
    Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));    
  */
  }
  else
  {
    _controllerLoading.add(false);
   }*/
     await _authencation.signWithEmailAndPassword(_emailController?.value, _passwordController?.value).then((fireBaseUser){
        
      Get.offAllNamed('/Home', (Route<dynamic>route)=>false);
      
     }).catchError((erro){
       print("Erro senha ${erro.toString()}");
        _controllerVazio.add(erro.toString());
       _controllerLoading.add(false);   
              
      });


}




onClickGoogle()async 
{
  print("Acessando Bloc ######");

  if(await _authencation.signWithGoogle())
  {
    print("Acessando Google");
      _controllerLoading.add(true);   
      print("Direcionando Rota");   
      Get.offAllNamed("/Home", (Route<dynamic> route) => false);

  }else
  {
    _controllerLoading.add(false);
  }

 
}

checkLogin()async
{

   _controllerLoading.add(false);
  FirebaseUser userAthu = await  FirebaseAuth.instance.currentUser();
  if(userAthu!=null)
  {
    print("Direcionando Rota");  
    Get.offAllNamed("/Home", (Route<dynamic> route) => false);
  }else
  {
    _controllerLoading.add(false);
  }
}

logout()async
{
  await FirebaseAuth.instance.signOut();
  Get.offAllNamed('/', (Route<dynamic>route)=>false);
}



void dispose()
{
  _controllerLoading.close();
  _emailController.close();
  _passwordController.close();
   _controllerVazio.close();
    
}


  




}
