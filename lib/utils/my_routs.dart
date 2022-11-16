import 'package:admin_sasta_bazar/screens/dashboard.dart';
import 'package:admin_sasta_bazar/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MyRoute{
  static const String login = "/login";
  static const String dashboard = "/dashboard";
  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: <GoRoute>[
      GoRoute(
        path:login,
        builder: (BuildContext context, GoRouterState state){
          return LoginScreen();
        },
      ),
      GoRoute(
        path:dashboard,
        builder: (BuildContext context, GoRouterState state){
          return DashboardScreen();
        },
       
      ),
    ],
  );

}