import 'package:admin_sasta_bazar/components/drawer_item.dart';
import 'package:admin_sasta_bazar/providers/dashboard_provider.dart';
import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/menu_model.dart';
import 'drawer_heading_text.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isExpanded;
  final List<MenuModel> menulist;

  const DrawerWidget({Key? key, this.isExpanded, required this.menulist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<DashboardProvider>(builder: (_, ref, child) {
      return AnimatedContainer(
        width: (isExpanded ?? true) ? size.width * 0.2 : 100,
        duration: const Duration(
          microseconds: 300,
        ),
        child: Container(
          color: MyThem.drawerBackgroundColor,
          child: ListView(
            children: const [
              SizedBox(height: 20,),
              DrawerItem(
                title: "Dashboard",
                leading: Icons.home_outlined,
                id: 1,
              ),
              DrawerItem(
                title: "POS",
                leading: Icons.shopping_basket_outlined,
                id: 2,
              ),
              DrawerHeadingText(
                title: "order Management",

              ),
              SizedBox(
                height: 10,
              ),
              DrawerItem(
                title: "Orders",
                leading: Icons.shopping_cart,
                id: 3,
              ),
              DrawerItem(
                title: "Order Refunds",
                leading: Icons.receipt_long,
                id: 4,
              ),
              DrawerItem(
                title: "Dispatch",
                leading: Icons.speed,
                id: 5,
              ),
              DrawerHeadingText(
                title: "item management",
              ),
              SizedBox(height: 10,),
              DrawerItem(
                title: "Items",
                leading: Icons.diamond,
                id: 6,
              ),
              DrawerItem(
                title: "Units",
                leading: Icons.horizontal_rule_rounded,
                id: 7,
              ),
            ],
          ),
        ),
      );
    });
  }
}
