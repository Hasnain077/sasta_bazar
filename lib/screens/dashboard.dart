import 'package:admin_sasta_bazar/providers/dashboard_provider.dart';
import 'package:admin_sasta_bazar/providers/login_provider.dart';
import 'package:admin_sasta_bazar/screens/login_screen.dart';
import 'package:admin_sasta_bazar/utils/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../utils/my_routs.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    bool b = LoginProvider().getLoggedInUser();
    print("current user $b");
    if (!b) {
      WidgetsBinding.instance.addPersistentFrameCallback((_) {
        context.go(MyRoute.login);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<DashboardProvider>(
      builder: (_, ref,child) {
        return Scaffold(
          primary: true,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: GestureDetector(
          //     onTap: () {
          //       if (_scaffoldKey.currentState != null) {
          //         if (_scaffoldKey.currentState!.isDrawerOpen) {
          //           _scaffoldKey.currentState!.closeDrawer();
          //         } else {
          //           _scaffoldKey.currentState!.openDrawer();
          //         }
          //       }
          //     },
          //     child: Icon(
          //       Icons.menu,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          body: ResponsiveBuilder(
            mobile: Scaffold(
              key: _scaffoldKey,
              drawer: Drawer(
                child: SizedBox(width: size.width * 0.7, child: drawerWidget()),
              ),
              body: Column(
                  children: [


                    Expanded(child: logOutButton())
                  ],

                  ),
            ),
            tablet: webDashboard(),
            web: webDashboard(),
          ),
        );
      }
    );
  }

  Widget webDashboard() {
    return Row(
      children: [
        Expanded(flex: 1, child: drawerWidget()),
        Expanded(
          flex: 14,
          child: logOutButton(),
        )
      ],
    );
  }

  Widget logOutButton() {
    return Center(
      child: Text("Logout"),
    );
  }

  Widget drawerWidget() {
    return Container(
      color: Colors.cyanAccent,
    );
  }

  }

