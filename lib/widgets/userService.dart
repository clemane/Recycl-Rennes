import 'package:firebase_auth/firebase_auth.dart';
import 'userModel.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> auth(UserModel userModel) async {
    UserCredential userCredential;

    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    }
    return userModel;
  }
}
