import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final Widget? suffixWidget;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final String? title;
  final String? hint;
  final bool? isObscure;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const TextFormFieldComponent(
      {Key? key,
      this.focusNode,
      this.controller,
      this.isObscure,
      this.suffixWidget,
      this.borderColor,
      this.hint,
      this.hintStyle,
      this.title,
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "Your Email",
            style: titleStyle ??
                TextStyle(
                  color: Colors.black,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 45,
            child: TextFormField(
              obscureText: isObscure ?? false,
              controller: controller,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                suffixIcon: suffixWidget,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: borderColor ?? MyThem.textFormBorder,
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: hint ?? "email@adress.com",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
