import 'package:ebayapp/screens/signUpScreen.dart';
import 'package:ebayapp/services/firebase_services.dart';
import 'package:ebayapp/widgets/app_style.dart';
import 'package:ebayapp/widgets/reusable_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/reusable_text_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  bool visibility = true;
  bool formState = false;
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log In',
                  style: GoogleFonts.abel(fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                ReusableTextField(
                  controller: emailC,
                  hintText: 'Email',
                  suffixIcon: const Icon(Icons.email),
                  validation: (e) {
                    if (e!.isEmpty || !e.contains('@')) {
                      return 'Email is badly formatted';
                    } else {
                      return null;
                    }
                  },
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
                  validation: (e) {
                    if (e!.isEmpty) {
                      return 'Password must be enter';
                    } else if (e.length < 6) {
                      return 'Password must be greater then 6 char';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  nextScreen: () {
                    setState(() {
                      formState = true;
                    });
                    if (_key.currentState!.validate()) {
                      FirebaseServices.logIn(
                          context, emailC.text, passwordC.text);
                    }
                  },
                  color: Colors.teal,
                  height: 40,
                  width: 150,
                  isLoading: formState,
                  buttonTitle: 'LogIn',
                  radius: BorderRadius.circular(10),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                        text: 'Dont have an account ',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: 'Sign Up',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp())),
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
