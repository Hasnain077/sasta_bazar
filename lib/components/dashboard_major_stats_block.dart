import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:flutter/material.dart';

class DashboardMajorStatsBlock extends StatelessWidget {
  final Color? color;
  final String? count;
  final String? title;
  final String? asset;
  final int? index;

  const DashboardMajorStatsBlock(
      {Key? key, this.color, this.asset, this.title, this.index, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (color ?? MyThem.dashboard_1).withOpacity(0.15),


      ),


    );
  }
}
