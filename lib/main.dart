import 'package:flutter/material.dart';
import 'package:untitled1/tela_cadastro.dart';
import 'package:untitled1/tela_login.dart';
import 'package:untitled1/tela_principal.dart';
import 'package:untitled1/tela_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/src/provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthService()),
          ChangeNotifierProvider(create: (context) => GoogleProvider()),

        ],
        child: MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
      routes: <String, WidgetBuilder>{
        '/landingpage' : (BuildContext context) => MyApp(),
        '/cadastro' : (BuildContext context) => TelaCadastro(),
        '/principal' : (BuildContext context) => TelaPrincipal(),
        '/home' : (BuildContext context) => TelaPrincipal(),
      },
    );
  }
}
