import 'package:ebayapp/services/firebase_services.dart';
import 'package:ebayapp/widgets/app_style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    FirebaseServices.checkUser(context);
    super.initState();

    // Timer(const Duration(seconds: 10), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const LogIn()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.mobile_friendly),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome here',
              style: AppStyle.textStyle,
            )
          ],
        ),
      ),
    );
  }
}
