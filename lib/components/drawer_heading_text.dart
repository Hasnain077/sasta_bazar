import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:flutter/material.dart';

class DrawerHeadingText extends StatelessWidget {
  final String? title;
  final bool isExpanded;

  const DrawerHeadingText({Key? key, this.title,this.isExpanded=true })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     isExpanded ?
      Padding(
      padding:  EdgeInsets.only(left: isExpanded ? 30 :10, top: 15),
      child: Text(
        (title ?? "").toUpperCase(),
        style: const TextStyle(
          color: MyThem.drawerSubHeadingColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    ): const Icon(Icons.more_horiz,color: MyThem.drawerSubHeadingColor,);
  }
}
