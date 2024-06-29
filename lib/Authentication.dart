import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Auth {
 String? loginCache;
  static Future<User?> registerUsingEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required BuildContext context
  }) async {
    print("func called");
    User? user;
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      const snackBar =
      SnackBar(content: Text("Successfully Registered"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use')
      {
        const snackBar =
        SnackBar(content: Text("email-already-in-use"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        const snackBar =
        SnackBar(content: Text("user-not-found"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        const snackBar =
        SnackBar(content: Text("wrong-password"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('Wrong password provided.');
      }
    }
    return user;
  }
static Future signOut(BuildContext context) async {
   try {
     return await FirebaseAuth.instance.signOut();
   } catch (e) {
     final snackBar =
     SnackBar(content: Text(e.toString()));
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
     print('Wrong password provided.');
   }
 }


}
