import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Auth({required this.loading});

  final void Function(bool loading) loading;

  void errorWidget(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Error occurred'),
              icon: Icon(
                Icons.error,
                size: 35,
              ),
              iconColor: Colors.red,
              content: Text(
                msg,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                )
              ],
            ));
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void createAccount({
    required String email,
    required String password,
    required String userName,
    required BuildContext context,
  }) async {
    loading(true);
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseAuth.currentUser!.updateDisplayName(userName);
      loading(false);
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      loading(false);
      errorWidget(context, e.message.toString());
    }
  }

  void signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    loading(true);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      loading(false);
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      loading(false);
      errorWidget(context, e.message.toString());
    }
  }

  void signOut() {
    loading(true);
    _firebaseAuth.signOut();
    loading(false);
  }

  signInWithGoogle(BuildContext context) async {
    loading(true);
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth =
          await googleSignInAccount!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      loading(false);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      loading(false);
      errorWidget(context, e.message.toString());
    }
  }
}
