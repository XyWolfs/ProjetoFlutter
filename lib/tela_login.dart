import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/tela_auth.dart';


class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}



class _TelaLoginState extends State<TelaLogin> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text('Bem Vindo ao'),
                  Image.asset(
                    'images/open.png',
                  ),


              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o email corretamente!';
                  }
                  return null;
                },
              ),


                  TextFormField(
                controller: senha,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informa sua senha!';
                  } else if (value.length < 6) {
                    return 'Sua senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),

                  ElevatedButton(
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          } else {
                            registrar();
                          }
                        }
                      },
                      child: Text("Login")
                  ),
                  SizedBox(height: 15.00,),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/cadastro');
                      },
                      child: Text("Cadastre-se")
                  ),
                  SizedBox(height: 10.0,
                  ),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/landingpage');
                      },
                      child: Text("Voltar")
                  ),
                  SizedBox(height: 15.00,),

                ],
              ),
            ),
          ),
    );
  }
}
