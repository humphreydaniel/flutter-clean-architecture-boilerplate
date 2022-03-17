import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

abstract class AuthFirebaseDataSource {
  Future<User> loginWithGoogle();

  Future<IdTokenResult> getUserToken();

  Future<void> logOut();
}

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  AuthFirebaseDataSourceImpl({
    @required this.googleSignIn,
    @required this.firebaseAuth,
  }) : assert(googleSignIn != null && firebaseAuth != null);

  @override
  Future<IdTokenResult> getUserToken() async {
    try {
      final _currentUser = firebaseAuth.currentUser;
      return await _currentUser.getIdTokenResult();
    } on FirebaseAuthException catch (e) {
      throw DefaultApiException(
        message: e?.message,
      );
    }
  }

  @override
  Future<void> logOut() {
    try {
      return Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
    } on FirebaseAuthException catch (e) {
      throw DefaultApiException(message: e?.message);
    } on PlatformException catch (e) {
      throw DefaultApiException(message: e?.message);
    }
  }

  @override
  Future<User> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final auth = await firebaseAuth.signInWithCredential(credential);
      return auth.user;
    } on FirebaseAuthException catch (e) {
      throw DefaultApiException(message: e?.message);
    }
  }
}
