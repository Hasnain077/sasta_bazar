import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isExpanded;
  const DrawerWidget({Key? key,this.isExpanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return     AnimatedContainer(
      width: (isExpanded?? true) ? size.width * 0.2 : 100,
      duration: const Duration(
        microseconds: 300,
      ),
      color: MyThem.drawerBackgroundColor,
      child: Container(

        

      ),

    );

  }
}
