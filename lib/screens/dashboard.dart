import 'package:admin_sasta_bazar/providers/login_provider.dart';
import 'package:admin_sasta_bazar/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/my_routs.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    bool b = LoginProvider().getLoggedInUser();
    print("current user $b");
    if (!b){
      WidgetsBinding.instance.addPersistentFrameCallback((_) {context.go(MyRoute.login); });
    }
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: ElevatedButton(onPressed: () async{
    await LoginProvider().logout();
    if(mounted){
      context.go(MyRoute.login);
    }

  }, child: Text("Logout")),
),      
      
    );
  }
}
