import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_mgt_app/config/constants/authConstants.dart';
import 'package:task_mgt_app/models/AuthUser.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final LocalStore localStore = LocalStore();

  Future signInWithEmailPassword(AuthUser user) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: user.userName, password: user.password);

      final firebaseUser = response.user;
      if (firebaseUser != null) {
        var result = await firestoreInstance
            .collection("users")
            .doc(response.user!.uid)
            .get()
            .then((value) => RegisterUser.fromDocumentSnapshotToLog(value));
        // value["isApproved"]
        if (!result.isRemoved!) {
          if (result.isApproved!) {
            localStore.clearUserdata();
            localStore.storeUserid(firebaseUser.uid.toString());
            return "Login Success";
          } else {
            return "This account doesn't \napproved yet";
          }
        } else {
          return "You have been removed!";
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "User not found \nPlease check email again";
      } else if (e.code == 'wrong-password') {
        return "The password you entered is incorrect";
      } else {
        return "An Undefined Error Happened";
      }
    } catch (e) {
      return "System is busy, try again later";
    }
  }

  Future signUpWithEmailPassword(RegisterUser user) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: user.email as String, password: user.password as String);

      final firebaseUser = response.user;
      if (firebaseUser != null) {
        await firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid.toString())
            .set({
          'userId': firebaseUser.uid,
          'name': user.name,
          'email': user.email,
          'isAdmin': user.isAdmin,
          'isApproved': false,
          "isRemoved": false,
          'position': user.position,
          'profileURL': user.profileURL,
          'createAt': DateTime.now(),
        });
        localStore.storeUser(user.toJson());
        return "Register Success";
      } else {
        return "Registration failed, \nPlease try again";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "The account already exists";
      } else if (e.code == 'weak-password') {
        return "Weak Password";
      } else if (e.code == 'invalid-email') {
        return "invalid email";
      } else {
        return "An Undefined Error Happened. Please make sure you are connected to the internet, \notherwise Please contact us";
      }
    } catch (e) {
      return "An Undefined Error Happened. Please make sure you are connected to the internet, \notherwise Please contact us";
    }
  }

  Future sendPasswordResetEmail(AuthEmail userEmail) async {
    try {
      await _auth.sendPasswordResetEmail(email: userEmail.userName);
      return "Reset Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "No user found";
      }
    }
  }

  Future signOut() async {
    try {
      localStore.clearUserdata();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
