import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future addUser({required String userId, required String name, required String email}) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(userId).set({'name': name, 'email': email});
    } catch (e) {
      return 'Error adding user';
    }
  }
}
