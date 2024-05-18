import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailTextEditcontroller =
      TextEditingController().obs;
  Rx<TextEditingController> passwordTextEditcontroller =
      TextEditingController().obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> handleSignInLinkToEmail() async {
    UserCredential? response;

    response = await signInWithEmailAndPassword(
        email: emailTextEditcontroller.value.text,
        password: passwordTextEditcontroller.value.text);

    response ??= await createUserWithEmailAndPassword(
        email: emailTextEditcontroller.value.text,
        password: passwordTextEditcontroller.value.text);

    if (response == null) {
      return;
    }

    print(response.user);
  }

  Future<void> handleSignInWithGoogle() async {
    final response = await signInWithGoogle();
    print(response);
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (err) {
      print(err);
    }
    return null;
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (err) {
      print(err);
    }
    return null;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
