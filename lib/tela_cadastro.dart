import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  String _email = "";
  String _senha = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Container(
       padding: EdgeInsets.all(25.0),
       child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[

         TextFormField(
           onChanged: (value){
             setState(() {
               _email = value;
             });
           },
           decoration: InputDecoration(
               border: OutlineInputBorder(),
             // hintText: "E-mail",
               labelText: "E-mail"
           ),
         ),
         SizedBox( height: 15.0,),

         TextFormField(
           onChanged: (value){
             setState(() {
               _senha = value;
             });
           },
           decoration: InputDecoration(
               border: OutlineInputBorder(),
             // hintText: "Digite sua senha",
               labelText: "Digite sua senha"
           ),
         ),
         SizedBox( height: 15.0,),

         ElevatedButton(
             onPressed: (){
               Navigator.of(context).pushReplacementNamed('tela_auth');
             },
             child: Text("Regitrar")
         ),
         SizedBox(height: 15.00,),

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
