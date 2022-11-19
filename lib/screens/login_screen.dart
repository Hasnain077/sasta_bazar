import 'package:admin_sasta_bazar/components/common_button.dart';
import 'package:admin_sasta_bazar/components/custom_background.dart';
import 'package:admin_sasta_bazar/components/text_form_field.dart';
import 'package:admin_sasta_bazar/providers/login_provider.dart';
import 'package:admin_sasta_bazar/utils/my_routs.dart';
import 'package:admin_sasta_bazar/utils/mythems.dart';
import 'package:admin_sasta_bazar/utils/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  bool isChecked = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  late Size size;
  late LoginProvider loginProvider;

  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    bool b = loginProvider.getLoggedInUser();
    print("current user $b");
    if (b) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(MyRoute.dashboard);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveBuilder(
        mobile: CustomBackground(
            fit: BoxFit.fitHeight,
            asset: "assets/png/login_portrait_background.jpg",
            child: loginForm),
        tablet: desktopLogin,
        web: desktopLogin,
      ),
    );
  }

  Widget get loginForm => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 30,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Signin",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Welcome back',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                            !ref.obscure
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                          value: ref.checked,
                          title: const Text("Remember me"),
                          controlAffinity: ListTileControlAffinity.leading,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          onChanged: (checked) {
                            ref.toggleCheckBox(checked ?? false);
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
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        onPressed: ref.isLoading
                            ? null
                            : () async {
                                // print(_emailController.text);
                                bool isLogin = await ref.login(
                                    _emailController.text.trim(),
                                    _passController.text);

                                if (isLogin && mounted) {
                                  context.go(MyRoute.dashboard);
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget get desktopLogin => CustomBackground(
        fit: BoxFit.fill,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: loginForm,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
