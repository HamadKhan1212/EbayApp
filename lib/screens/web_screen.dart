import 'package:ebayapp/screens/home_screen.dart';
import 'package:ebayapp/widgets/reusable_button.dart';
import 'package:ebayapp/widgets/reusable_text_field.dart';
import 'package:flutter/material.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  String email = 'hamadkhan123@gmail.com';
  String password = 'admin123';
  bool visibility = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _key,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 3)),
            child: Column(
              children: [
                const Text(
                  'Welcome Admin ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal),
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  controller: emailC,
                  hintText: 'Email',
                  suffixIcon: const Icon(Icons.email),
                  validation: (e) {
                    if (e!.isEmpty || e != 'hamadkhan123@gmail.com') {
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
                    if (e!.isEmpty || e != 'admin123') {
                      return 'Password badly formatted';
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
                  radius: BorderRadius.circular(10),
                  nextScreen: () {
                    if (_key.currentState!.validate()) {
                      if (emailC.text == email || passwordC.text == password) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      }
                    }
                  },
                  buttonTitle: 'LogIn',
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
