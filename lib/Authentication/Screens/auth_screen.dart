import 'package:amazon/authentication/Services/auth_service.dart';
import 'package:amazon/constants/gobal_variables.dart';
import 'package:amazon/widgets/custom_button.dart';
import 'package:amazon/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routename = "/sign-in-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth auth = Auth.signup;
  final signupformkey = GlobalKey<FormState>();
  final signinformkey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signupuser() {
    authService.signUpUser(
      context: context,
      email: emailController.text.toString(),
      name: nameController.text.toString(),
      password: passwordController.text.toString(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                ListTile(
                  tileColor: auth == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundColor,
                  title: const Text(
                    "Create Account",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: auth,
                    onChanged: (val) {
                      setState(() => auth = val!);
                    },
                  ),
                ),
                if (auth == Auth.signup)
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: signupformkey,
                        child: Column(
                          children: [
                            CustomTextWidget(
                              hinttext: "Name",
                              controller: nameController,
                            ),
                            const SizedBox(height: 10),
                            CustomTextWidget(
                              hinttext: "Email",
                              controller: emailController,
                            ),
                            const SizedBox(height: 10),
                            CustomTextWidget(
                              hinttext: "Password",
                              controller: passwordController,
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: "Signup",
                              onTap: () {
                                if (signupformkey.currentState!.validate()) {
                                  signupuser();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ListTile(
                  tileColor: auth == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundColor,
                  title: const Text(
                    "Sign-In Account",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: auth,
                    onChanged: (Auth? val) {
                      setState(() => auth = val!);
                    },
                  ),
                ),
                if (auth == Auth.signin)
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: signinformkey,
                        child: Column(
                          children: [
                            CustomTextWidget(
                              hinttext: "Email",
                              controller: emailController,
                            ),
                            const SizedBox(height: 10),
                            CustomTextWidget(
                              hinttext: "Password",
                              controller: passwordController,
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: "Login",
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
