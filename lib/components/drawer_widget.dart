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

        width: (isExpanded ?? true) ? size.width * 0.2 : 80,
        duration: const Duration(
          microseconds: 300,
        ),
        child: Container(

          color: MyThem.drawerBackgroundColor,
          child: ListView(

            children:  [

              SizedBox(height: 20,),
              DrawerItem(

                title: "Dashboard",
                leading: Icons.home_outlined,

                id: 1,
                 isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "POS",
                leading: Icons.shopping_basket_outlined,
                id: 2,
                isExpanded: isExpanded ?? false,
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
                isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "Order Refunds",
                leading: Icons.receipt_long,
                id: 4,
                isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "Dispatch",
                leading: Icons.speed,
                id: 5,
                isExpanded: isExpanded ?? false,
              ),
              DrawerHeadingText(
                title: "item management",

              ),
              SizedBox(height: 10,),
              DrawerItem(
                title: "Categories",
                leading: Icons.lan,
                id: 6,
                isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "Items",
                leading: Icons.diamond,
                id: 7,
              isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "Units",
                leading: Icons.horizontal_rule_rounded,
                id: 8,
                isExpanded: isExpanded ?? false,
              ),
              DrawerHeadingText(
                title: "delevery management",

              ),
              SizedBox(height: 10,),
              DrawerItem(
                title: "Add Delivery Man",
                leading: Icons.directions_run_outlined,
                id: 9,
                isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "Delivery Man List",
                leading: Icons.filter_list,
                id: 10,
                isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "Reviews",
                leading: Icons.star_border,
                id: 11,
isExpanded: isExpanded ?? false,
              ),
              DrawerHeadingText(
                title: "employee management",

              ),
              SizedBox(height: 10,),
              DrawerItem(
                title: "Employee Role",
                leading: Icons.security,
                id: 12,
isExpanded: isExpanded ?? false,
              ),
              DrawerItem(
                title: "Employee List",
                leading: Icons.person,
                id: 13,
                isExpanded: isExpanded ?? false,
              ),
            ],
          ),
        ),
      );
    });
  }
}
