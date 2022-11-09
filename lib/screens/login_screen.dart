import 'package:admin_sasta_bazar/components/common_button.dart';
import 'package:admin_sasta_bazar/components/text_form_field.dart';
import 'package:admin_sasta_bazar/utils/responsive_builder.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
          mobile: loginForm(), tablet: Container(), web: Container()),
    );
  }

  Widget loginForm() {
    return Container(

      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Signin",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 35,
            ),
          ),

          const Text(
            'Welcome back',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        TextFormFieldComponent(
          title: "Your Email",
          hint: "email@adress.com",
        ),

          const SizedBox(
            height: 20,
          ),
          TextFormFieldComponent(
           isObscure: isObscure,
            title: "Password",
            hint: "6+ charecters required",
            suffixWidget: GestureDetector(
              onTap: () {
    isObscure = !isObscure;
    setState(() {});
    },
      child: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
    ),

          ),


          // TextFormField(
          //   obscureText: isObscure,
          //   obscuringCharacter: "*",
          //   decoration: InputDecoration(
          //     prefixIcon: const Icon(Icons.lock),
          //     hintText: "6+ characters required",
          //
          //   ),
          // ),

           const SizedBox(
             height: 10,
           ),
          CheckboxListTile(value: isChecked,
              title: Text("Remember me"),
           controlAffinity: ListTileControlAffinity.leading,
              visualDensity: VisualDensity(horizontal: -4,vertical: -4),
              onChanged: (a){
            setState(() {
              isChecked = a ?? false;
            });
          }),
          
          
          const SizedBox(
            height: 50,
          ),
         PrimaryButtonComponent(
           text: "Login",
           borderRadius: 8,
           verticalPadding: 10,
           textStyle: TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.w400,
           ),
           onPressed: (){},


         ),
        ],
      ),
    );
  }
}
