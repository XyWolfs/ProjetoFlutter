import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Open Unifeob"),

      ),


      drawer: Drawer(),
      body: Center(
        child: Container(
        padding: EdgeInsets.all(25.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

      Text('Analise e Desenvolvimento de Sistemas'),
      Image.asset(
        'images/ads.png',
      ),

      Text('Direito'),
      Image.asset(
        'images/direito.jpg',
      ),

      ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('/landingpage');
          },
          child: Text("Back")
      ),
      SizedBox(height: 15.00,)





          ],
         ),
        )
       ),
      );


  }
}
