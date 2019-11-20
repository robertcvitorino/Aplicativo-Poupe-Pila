import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poupe/app/app_module.dart';
import 'package:poupe/app/modules/home/home_module.dart';
import 'package:poupe/app/modules/login/login_bloc.dart';
import 'package:poupe/app/modules/login/subpages/create/create_module.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final formKey = new GlobalKey<FormState>();
  final bloc = AppModule.to.getBloc<LoginBloc>();
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.checkLogin();

    _button() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton.icon(
              color: Colors.green,
              textColor: Colors.white,
              onPressed: bloc.onClickGoogle,
              icon: Icon(FontAwesomeIcons.google),
              label: Text("Google")),
          Container(
            width: 15,
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Logo
            _logo(context),
            //Nome do Aplicativo
            _name(context),
            //Email
            _email(context),
            //Senha
            _password(context),
            //Botão de email e recuperação de senha
            _resetPaswordAndCreated(context),
            //Botã ode Login
            _bottonLogin(context),

            StreamBuilder(
                stream: bloc.outLoading,
                initialData: false,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return AnimatedSwitcher(
                      duration: const Duration(seconds: 2),
                      child: snapshot.data
                          ? Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(),
                            )
                          : _button());
                })
          ],
        ),
      ),
    );
  }

//Metodo que cria a Logo que está instanciado acima
  _logo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 50, 35, 25),
      child: Container(
        height: 150,
        width: 100,
        child: Image.asset('assets/image/logo-poupe.png'),
      ),
    );
  }

//Metodo que cria o nome do apicativo que está instanciado acima
  _name(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 20, 35, 20),
      child: Text(
        "Poupe Pila",
        style: TextStyle(
          color: Colors.green,
          fontSize: 30,
          fontWeight: FontWeight.w300,
        ),
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
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'E-mail',
                hintStyle: TextStyle(color: Colors.green),
              ),
              validator: (String value) {
                return value.contains('@') ? null : 'E-mail invalido.';
              },
              onChanged: (String value) => bloc.emailEvent.add(value),
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
                hintText: '*********',
                hintStyle: TextStyle(color: Colors.green),
              ),
              validator: (String value) =>
                  value.length < 8 ? 'Senha deve conter 8 caracteres' : null,
              onChanged: (String value) => bloc.passwordEvent.add(value),
            ),
          ),
        ],
      ),
    );
  }

//Metodo que cria o os botoes de recuperar senha e criar conta está  instanciado acima
  _resetPaswordAndCreated(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              color: Colors.transparent,
              onPressed: () => {},
              child: Text(
                "Recuperar Senha",
                style: TextStyle(color: Colors.green, fontSize: 10),
              ),
            ),
          ),
          Expanded(
            child: new FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              color: Colors.transparent,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CreateModule()));
              },
              child: Text(
                "Criar Conta",
                style: TextStyle(color: Colors.green, fontSize: 10),
              ),
            ),
          )
        ],
      ),
    );
  }

//Metodo que cria o os botão de Login que está  instanciado acima
  _bottonLogin(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                color: Colors.green,
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    if (bloc.outVazio != 'Invalid argument(s)') {
                      _showDialog();
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeModule()));
                    }
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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Senha invalida"),
          content: new Text("Informe a senha correta"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
