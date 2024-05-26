import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user = Rxn<User>();
  var error = ''.obs;

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      error.value = e.toString();
    }
  }


  //This is the Code of the Registration Screen for registering the user
  Future<void> registerWithEmailAndPassword(String email, String password, String name, String phone, String address) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? newUser = result.user;

      if (newUser != null) {
        await _firestore.collection('users').doc(phone).set({
          'name': name,
          'phone': phone,
          'address': address,
          'email': email,
          'uid': newUser.uid,
        });
      }
      error.value = '';
    } catch (e) {
      error.value = e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
