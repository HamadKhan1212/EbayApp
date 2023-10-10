import 'package:ebayapp/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/firebase_services.dart';
import '../widgets/app_style.dart';
import '../widgets/reusable_button.dart';
import '../widgets/reusable_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameC = TextEditingController();
  final lastNameC = TextEditingController();
  final phoneNumberC = TextEditingController();
  final addressCC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  bool fromStateLoading = false;
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: GoogleFonts.abel(fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                ReusableTextField(
                  controller: firstNameC,
                  hintText: 'First Name',
                  suffixIcon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReusableTextField(
                  controller: lastNameC,
                  hintText: 'Last Name',
                  suffixIcon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReusableTextField(
                  controller: addressCC,
                  hintText: 'Address',
                  suffixIcon: const Icon(Icons.map),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReusableTextField(
                  controller: phoneNumberC,
                  hintText: 'Phone Number',
                  suffixIcon: const Icon(Icons.phone),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReusableTextField(
                  controller: emailC,
                  hintText: 'Email',
                  suffixIcon: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReusableTextField(
                  controller: passwordC,
                  hintText: 'Password',
                  visibility: visibility,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: visibility
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  nextScreen: () {
                    setState(() {
                      fromStateLoading = true;
                    });
                    FirebaseServices.signUp(
                        context,
                        emailC.text,
                        passwordC.text,
                        firstNameC.text,
                        lastNameC.text,
                        addressCC.text,
                        phoneNumberC.text);
                  },
                  color: Colors.teal,
                  height: 40,
                  width: 150,
                  buttonTitle: 'SignUp',
                  radius: BorderRadius.circular(10),
                  isLoading: fromStateLoading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account: ',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: 'Log In',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LogIn()),
                                    (route) => false),
                              style: AppStyle.textStyle
                                  .copyWith(color: Colors.blue, fontSize: 15))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
