import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(User_app user) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.PassWord,
    );
    // Récupérer le UID de l'utilisateur
    String uid = userCredential.user!.uid;
    // Enregistrer le UID de l'utilisateur dans l'objet User_app
    user.Id = uid;
    // Enregistrer les données de l'utilisateur dans Firestore
    await FirebaseFirestore.instance.collection("Users").doc(uid).set(user.toJson());
  } catch (error) {
    print(error);
  }
}

String? getCurrentUserId() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.uid;
  } else {
    // L'utilisateur n'est pas connecté
    return null;
  }
}





