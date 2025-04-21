import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    // formKey.currentState!.validate();
    super.dispose();
  }

  void signUpUser() {
    if (formKey.currentState!.validate()) {
      // store the user data using nodejs
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter a Name",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Name field cannot be empty...!";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter a Email",
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.trim().contains("@")) {
                  return "Email field is Invalid...!";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Enter a Password",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Password field cannot be empty!";
                } else if (value.trim().length <= 6) {
                  return "Password must be more than 6 character...!";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: signUpUser,
              child: const Text(
                "SIGN UP",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(LoginPage.route());
              },
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                  children: const [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
