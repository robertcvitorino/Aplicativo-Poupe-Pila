import 'package:flutter/material.dart';
import 'package:poupe/app/modules/home/home_module.dart';
import 'package:poupe/app/modules/login/login_module.dart';
import 'package:poupe/app/modules/login/subpages/create/create_bloc.dart';

class CreatePage extends StatefulWidget {
  final String title;
  const CreatePage({Key key, this.title = "Registrar"}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}
final formKey =  new  GlobalKey < FormState > ();
class _CreatePageState extends State<CreatePage> {

 final bloc = LoginModule.to.getBloc<CreateBloc>();

  @override
  Widget build(BuildContext context) { 

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.green,
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Form(
                  key: formKey,
          child: Column(
            children: <Widget>[
              _text(context),
              _name(context),
              _email(context),
              _password(context),
              _confPassword(context),
              SizedBox(height: 40,),
              _buttonLogin(context)
            ],
          ),
        ))));
  }

  String emailValidator(String emailValue) {
    
      if (emailValue.contains('@')) {
        return 'Email invalido';
      } else {
        return null;
      }
    }

    String passwordValidator(String passwordValue) {
      if (passwordValue.length < 8) {        
        return 'Senha deve conter 8 caracter';
      }
      if(passwordValue==passwordValue){
          return null;
        }
      else {
        return null;
      }
    }
//Metodo que cria o nome do apicativo que está instanciado acima
_text(BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(35, 20, 35, 20),
    child: Text(
      "Parar realizar o cadastro no aplicativo informe os dados solicitados nos campos abaixo",
      style: TextStyle(
        color: Colors.grey[500],
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}

_name(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Colors.green, width: 0.5, style: BorderStyle.solid),
      ),
    ),
    padding: const EdgeInsets.only(left: 0.0, right: 10.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
          child: Icon(
            Icons.account_circle,
            color: Colors.green,
          ),
        ),
        new Expanded(
          child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Nome',
                hintStyle: TextStyle(color: Colors.green),
              ),
              validator: (String value) {
                if (value.length < 3) {
                  return "Por favor informe o nome";
                }
              },
              onChanged:(String value)=> bloc.nameEvent.add(value),
              ),
        ),
      ],
    ),
  );
}

//Metodo que cria o input email do apicativo que está instanciado acima
_email(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Colors.green, width: 0.5, style: BorderStyle.solid),
      ),
    ),
    padding: const EdgeInsets.only(left: 0.0, right: 10.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
          child: Icon(
            Icons.alternate_email,
            color: Colors.green,
          ),
        ),
        new Expanded(
          child: TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              
              hintText: 'E-mail',
              hintStyle: TextStyle(color: Colors.green),
            ),
            validator:(String value) {
                                      return value.contains('@') ?null:'Do not use the @ char.';
                              },
            onChanged: (String value)=>bloc.emailEvent.add(value),
          ),
        ),
      ],
    ),
  );
}

//Metodo que cria o input password do apicativo que está instanciado acima
_password(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Colors.green, width: 0.5, style: BorderStyle.solid),
      ),
    ),
    padding: const EdgeInsets.only(left: 0.0, right: 10.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
          child: Icon(
            Icons.lock_open,
            color: Colors.green,
          ),
        ),
        new Expanded(
          child: TextFormField(
            obscureText: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Senha',
              hintStyle: TextStyle(color: Colors.green),
            ),
            validator: (String value)=> passwordValidator(value),
            onChanged: (String value)=> bloc.passwordEvent.add(value)
          ),
        ),
      ],
    ),
  );
}
_confPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Colors.green, width: 0.5, style: BorderStyle.solid),
      ),
    ),
    padding: const EdgeInsets.only(left: 0.0, right: 10.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
          child: Icon(
            Icons.lock_open,
            color: Colors.green,
          ),
        ),
        new Expanded(
          child: TextFormField(
            obscureText: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,              
              hintText: 'Confirma senha',
              hintStyle: TextStyle(color: Colors.green),
            ),
            validator: (String value)=> passwordValidator(value),
            onChanged: (String value)=>bloc.consPasswordEvent.add(value),
          ),
        ),
      ],
    ),
  );
}
//Metodo que cria o os botão de Login que está  instanciado acima 
_buttonLogin(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10.0),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 20),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              color: Colors.green,
              onPressed: () {               
                if(formKey.currentState.validate()){
                    bloc.onClickLogin();
                  print("Botao clicado    ##");                                   
                  
                 }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ));
}
}