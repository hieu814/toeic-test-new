import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class GoogleAuthHelper {
  /// Handle Google Signin to authenticate user
  Future<GoogleSignInAccount?> googleSignInProcess() async {
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
    print("ADsdaddas ${credential.toString()}");
    // Once signed in, return the UserCredential
    final _credential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print("ADsdaddas ${_credential.toString()}");
    if (_credential != null) {
      return googleUser;
    }
  }

  /// To Check if the user is already signedin through google
  alreadySignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    bool alreadySignIn = await _googleSignIn.isSignedIn();
    return alreadySignIn;
  }

  /// To signout from the application if the user is signed in through google
  Future<GoogleSignInAccount?> googleSignOutProcess() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signOut();

    return googleUser;
  }
}
