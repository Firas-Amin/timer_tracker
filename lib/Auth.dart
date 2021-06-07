import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:math';
abstract class AuthBase{

User get currentUser;
Future<User> signInAnonymously();
Future<void> signOut();
Stream<User> authChange();
Future<User> signInGoogle();



}
class Auth implements AuthBase {

final _firebaseAuth  = FirebaseAuth.instance;
final _signGoogle = GoogleSignIn();


Stream<User> authChange() => _firebaseAuth.authStateChanges();


@override
User get currentUser =>  _firebaseAuth.currentUser;

@override
Future<User> signInAnonymously() async{
  final userCredential= await _firebaseAuth.signInAnonymously();
  return userCredential.user;

}
@override
Future<User> signInGoogle() async{ // allowing the users to sign in with google

  final userGoogle = await _signGoogle.signIn();
  if(userGoogle != null){
    final authGoogle = await userGoogle.authentication;
    if( authGoogle.idToken != null){ // we can only sign in with google if we have a valid idToken
      final userCredential = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
        idToken: authGoogle.idToken ,
        accessToken: authGoogle.accessToken,
      ));
      return userCredential.user;
    }else{
    throw FirebaseAuthException(
      code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
      message: 'Missing Google ID Token',
    );
    }

  }else{
    throw FirebaseAuthException(
      code: 'ERROR_ABORTED_BY_USER',
      message: 'Sign in aborted by user',
    );
  }
}



@override
Future<void> signOut()async{
  await _signGoogle.signOut();
  await _firebaseAuth.signOut();
}

}
