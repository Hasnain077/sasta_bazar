import 'package:admin_sasta_bazar/providers/login_provider.dart';
import 'package:admin_sasta_bazar/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class  MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_)=> LoginProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),

      ),
    )
    ;

  }
}