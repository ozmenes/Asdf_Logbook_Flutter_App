import 'package:asdf_logbook/pages/home/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuthModel{
  final String? uid;
  UserAuthModel({this.uid});
}
class UserAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserAuthModel? userFromFirebaseUser(User user){
    if (user != null) { // (user != null && !user.emailVerified)
      debugPrint('uid: ${user.uid}');
      debugPrint('currentUser : ${_auth.currentUser?.uid}');
      return UserAuthModel(uid: user.uid);
    } else {
      return null;
    }
  }
  // auth change user stream
  Stream<UserAuthModel?> get user{
    return _auth.authStateChanges().map((User? user) => userFromFirebaseUser(user!));
  }
  //register with email and pass
  Future registerWithEmailAndPassword(String email, String password)async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      return userFromFirebaseUser(user!);
    }catch(e){
      debugPrint("Error on signInWithEmailAndPassword = $e");
      return null;
    }
  }
  //sign in with email and pass
  Future signInWithEmailAndPassword(String email, String password)async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      return userFromFirebaseUser(user!);
    }catch(e){
      debugPrint("Error on signInWithEmailAndPassword = $e");
      return null;
    }
  }
  //sign out
  Future<void> signOut(context) async{
    try{
      //return await _auth.signOut();
      return await _auth.signOut().then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const WelcomePage()),(route) => false));
    }on FirebaseAuthException catch(error){
      //FirebaseAuthError authError = FirebaseAuthService.getError(error.code);
      debugPrint("SignOut Firebase error: ${error.code}");
    }catch(e){
      debugPrint("SignOut error: $e");
    }
  }
}