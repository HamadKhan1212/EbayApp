import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebayapp/screens/home_screen.dart';
import 'package:ebayapp/screens/layout_screen.dart';
import 'package:ebayapp/screens/login_screen.dart';
import 'package:ebayapp/widgets/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth firebaseInstance = FirebaseAuth.instance;
final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

class FirebaseServices {
  static Future<bool> logIn(context, String email, String password) async {
    try {
      await firebaseInstance.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      AppWidgets().appDialog(e.toString(), context);
      e.code.toString();
    }
    return true;
  }

  static Future<bool> signUp(
      context,
      String email,
      String password,
      String firstName,
      String lastName,
      String address,
      String phoneNumber) async {
    try {
      await firebaseInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      fireStoreInstance
          .collection('user')
          .doc(firebaseInstance.currentUser!.uid)
          .set({
        'FirstName': firstName,
        'Last Name': lastName,
        'Address': address,
        'Phone Number': phoneNumber,
        'Email': email,
        'Password': password
      });
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LogIn()));
    } on FirebaseAuthException catch (e) {
      AppWidgets().appDialog(e.toString(), context);
      e.code.toString();
    }
    return true;
  }

  static checkUser(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Timer(const Duration(seconds: 5), () {
      if (user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LayoutScreen()),
            (route) => false);
      }
    });
  }

  static Future logOut(context) async {
    await firebaseInstance.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const LogIn()), (route) => true);
  }
}
