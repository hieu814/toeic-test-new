import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FirebaseAuthHelper {
  Future<UserCredential?> googleSignInProcess() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final _credential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (_credential != null) {
        return _credential;
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "";
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      print({loginResult: loginResult});
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "";
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      print("asdads ${e}");
      if (e.code == 'user-not-found') {
        throw Error();
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      }
      throw e.message ?? "";
    }
  }

  Future<UserCredential?> signUp(Map req) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: req['email'],
        password: req['password'],
      );
      await credential.user!.updateDisplayName(req['name']);
      await credential.user!.reload();
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      }
    } catch (e) {
      throw (e);
    }
  }

  /// To Check if the user is already signedin through google
  alreadySignIn() async {
    var user = _auth.currentUser;
    print(user);
    if (user != null) {
      return true;
    }
    return false;
  }

  /// To signout from the application if the user is signed in through google
  Future<GoogleSignInAccount?> googleSignOutProcess() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signOut();

    return googleUser;
  }
}
