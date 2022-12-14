import 'package:admin_sasta_bazar/providers/dashboard_provider.dart';
import 'package:admin_sasta_bazar/providers/login_provider.dart';
import 'package:admin_sasta_bazar/screens/login_screen.dart';
import 'package:admin_sasta_bazar/utils/my_routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class  MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_)=>DashboardProvider()),
        ChangeNotifierProvider(create: (_)=> LoginProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: MyRoute.router,
        theme: ThemeData(fontFamily: "Poppins"),
        debugShowCheckedModeBanner: false,
        // home: LoginScreen(),

      ),
    )
    ;

  }
}