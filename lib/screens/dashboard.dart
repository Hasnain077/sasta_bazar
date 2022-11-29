import 'package:admin_sasta_bazar/components/drawer_widget.dart';
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
    return Consumer<DashboardProvider>(builder: (_, ref, child) {
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
              child: SizedBox(
                width: size.width * 0.7,
                child: drawerWidget(),
              ),
            ),
            body: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_scaffoldKey.currentState != null) {
                      if (_scaffoldKey.currentState!.isDrawerOpen) {
                        _scaffoldKey.currentState!.closeDrawer();
                      } else {
                        _scaffoldKey.currentState!.openDrawer();
                      }
                      ref.toggleMobileExpansion(
                          value: _scaffoldKey.currentState!.isDrawerOpen);
                    }
                  },
                  child: Row(
                    children: [
                      // Visibility(
                      //     child: Container(
                      //   width: 20,
                      //   color: Colors.cyanAccent,
                      // )),
                      Icon(
                        _scaffoldKey.currentState != null
                            ? (ref.isMobileDrawerOpen
                                ? Icons.menu
                                : Icons.close_rounded)
                            : (ref.isDrawerExpanded
                                ? Icons.menu
                                : Icons.close_rounded),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Expanded(child: logOutButton()),
              ],
            ),
          ),
          tablet: webDashboard(ref.isDrawerExpanded, size, ref),
          web: webDashboard(ref.isDrawerExpanded, size, ref),
        ),
      );
    });
  }

  Widget webDashboard(bool expanded, Size size, DashboardProvider ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (_scaffoldKey.currentState != null) {
              if (_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState!.closeDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
              ref.toggleMobileExpansion(
                  value: _scaffoldKey.currentState!.isDrawerOpen);
            } else {
              ref.toggleExpansion();
            }
          },
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/png/logo.png",
                    height: 50,
                  )),
              Icon(
                _scaffoldKey.currentState != null
                    ? (ref.isMobileDrawerOpen
                        ? Icons.close_rounded
                        : Icons.menu)
                    : (ref.isDrawerExpanded ? Icons.close_rounded : Icons.menu),
                color: Colors.black,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              DrawerWidget(menulist: [],isExpanded:ref.isDrawerExpanded),
            ],
          ),
        ),
      ],
    );
  }

  Widget logOutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await LoginProvider().logout();
          if (mounted) {
            context.go(MyRoute.login);
          }
        },
        child: Text("Logout"),
      ),
    );
  }

  Widget drawerWidget() {
    return Container(
      color: Colors.red,
      // width: 100,
    );
  }
}
