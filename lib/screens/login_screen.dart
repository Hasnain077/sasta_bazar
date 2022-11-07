import 'package:admin_sasta_bazar/utils/responsive_builder.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
          mobile: loginForm(), tablet: Container(), web: Container()),
    );
  }

  Widget loginForm() {
    return Container(
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.bottomCenter,
      //       end: Alignment.topCenter,
      //       colors: <Color>[Colors.blue, Colors.green ])
      // ),
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Signin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text("Your Email",
              style: TextStyle(
                fontSize: 20,
              ),),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "email@adress.com",

                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text("Password",
              style: TextStyle(
                fontSize: 20,
              ),),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "6+ characters required"
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Login",
                  style: TextStyle(
                    fontSize: 15,
                  ),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.teal.shade600,
                    ),
                  )),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
