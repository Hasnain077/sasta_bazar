import 'package:admin_sasta_bazar/components/common_button.dart';
import 'package:admin_sasta_bazar/components/text_form_field.dart';
import 'package:admin_sasta_bazar/providers/login_provider.dart';
import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:admin_sasta_bazar/utils/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool isObscure = true;
  // bool isChecked = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  late Size size;
  late LoginProvider loginProvider;

  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveBuilder(
        mobile: loginForm,
        tablet: desktopLogin,
        web: desktopLogin,
      ),
    );
  }

  Widget get loginForm => Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              controller: _emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<LoginProvider>(
              builder: (_, ref, child) => TextFormFieldComponent(
                isObscure: ref.obscure,
                title: "Password",
                hint: "6+ charecters required",
                controller: _passController,
                suffixWidget: GestureDetector(
                  onTap: () {
                    ref.toggleObscure();
                  },
                  child: Icon(
                    !ref.obscure ? Icons.visibility_off : Icons.visibility,
                    color: MyThem.textFromBorder,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<LoginProvider>(
              builder: (_, ref, child) => CheckboxListTile(
                  value: ref.isChecked,
                  title: Text("Remember me"),
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  onChanged: (a) {
                    ref.toggleCheckBox();
                  }),
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer<LoginProvider>(
              builder: (_, ref, child) => PrimaryButtonComponent(
                text: ref.isLoading ? "Loading..." : "Login",
                borderRadius: 8,
                verticalPadding: 10,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                onPressed: ref.isLoading
                    ? null
                    : () {
                        ref.login("username", "password");
                      },
              ),
            ),
          ],
        ),
      );

  Widget get desktopLogin => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/png/logo.png",
                            height: size.height * 0.2,
                          ),
                          Expanded(
                            child: Image.asset(
                              "assets/png/login_background.png",
                              height: size.height,
                              width: size.width * .6,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "sasta bazar ADMIN PANEL",
                        style: GoogleFonts.rubikBubbles(
                          color: Colors.teal,
                          fontSize: 35,
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: loginForm,
            ),
          ],
        ),
      );
}
