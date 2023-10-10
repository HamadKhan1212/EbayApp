import 'package:ebayapp/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC9PmfFQH84zvET6_QpEW9ctrY-sZxCEtI",
            authDomain: "e-bay-83192.firebaseapp.com",
            projectId: "e-bay-83192",
            storageBucket: "e-bay-83192.appspot.com",
            messagingSenderId: "967197294823",
            appId: "1:967197294823:web:e453dacfc8737345eca242"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
