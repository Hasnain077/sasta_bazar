import 'package:admin_sasta_bazar/providers/dashboard_provider.dart';
import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerItem extends StatelessWidget {
  final int? id;
  final String? title;
  final IconData? leading;
  final Function(int?)? onTap;
  final bool isExpanded;

  const DrawerItem(
      {Key? key,
      this.isExpanded = true,
      this.title,
      this.id,
      this.leading,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (_, ref, child) {
      return Tooltip(
        message: isExpanded ? "":title ?? "",
        preferBelow: false,
        margin: const EdgeInsets.only(left: 80),
        decoration: BoxDecoration(
          color: MyThem.drawerSubHeadingColor,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            onTap: () {
              ref.setActiveDrawer(id ?? 0);
            },
            child: AnimatedContainer(
              duration: const Duration(microseconds: 300),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ref.activeHoverDrawerIndex ==id || ref.activeDrawerIndex == id
                    ? MyThem.drawerSelectedBackColor
                    : null,
              ),
              child: isExpanded
                  ? Row(
                      children: [
                        Icon(
                          leading,
                          color:ref.activeHoverDrawerIndex == id || ref.activeDrawerIndex == id
                              ? MyThem.drawerActiveTextColor
                              : Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          title ?? "",
                          style: TextStyle(
                            fontSize: 13,
                            color:ref.activeHoverDrawerIndex==id|| ref.activeDrawerIndex == id
                                ? MyThem.drawerActiveTextColor
                                : Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Icon(
                      leading,
                      color:ref.activeHoverDrawerIndex == id|| ref.activeDrawerIndex == id
                          ? MyThem.drawerActiveTextColor
                          : Colors.white,
                    ),
            ),
          ),
        ),
      );
    });
  }
}
