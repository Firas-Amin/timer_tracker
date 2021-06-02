import 'package:firebase_auth/firebase_auth.dart';
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
@override
Future<void> signOut()async{
  await _firebaseAuth.signOut();
}


}