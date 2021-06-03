import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
abstract class AuthBase{

User get currentUser;
Future<User> signInAnonymously();
Future<void> signOut();
Stream<User> authChange();

}
class Auth implements AuthBase {

final _firebaseAuth  = FirebaseAuth.instance;


Stream<User> authChange() => _firebaseAuth.authStateChanges();


@override
User get currentUser =>  _firebaseAuth.currentUser;

@override
Future<User> signInAnonymously() async{
  final userCredential= await _firebaseAuth.signInAnonymously();
  return userCredential.user;

}

Future<User> signInGoogle() async{ // allowing the users to sign in with google
  final signGoogle = GoogleSignIn();
  final userGoogle = await signGoogle.signIn();
  if(userGoogle != null){
    final authGoogle = await userGoogle.authentication;

    if( authGoogle.idToken != null){
      final userCredential = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
        idToken: authGoogle.idToken ,
        accessToken: authGoogle.accessToken,
      ));
      return userCredential.user;
    }
  }
}
@override
Future<void> signOut()async{
  await _firebaseAuth.signOut();
}


}