import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:flutter/material.dart';

class PrimaryButtonComponent extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttonColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final String? text;
  final TextStyle? textStyle;

  const PrimaryButtonComponent(
      {Key? key,
      this.text,
      this.textStyle,
      this.borderRadius,
      this.buttonColor,
      this.horizontalPadding,
      this.onPressed,
      this.verticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor?? MyThem.btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius?? 0),
          ),
          padding: EdgeInsets.symmetric(vertical: 12),

        ),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: verticalPadding?? 0,horizontal: horizontalPadding?? 0),
          child: Text( text??
              "Login",
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
