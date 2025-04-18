import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(String uid, Map<String, dynamic> data) {
    return _db.collection('users').doc(uid).set(data);
  }

  Future<DocumentSnapshot> getUser(String uid) {
    return _db.collection('users').doc(uid).get();
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) {
    return _db.collection('users').doc(uid).update(data);
  }

  Stream<QuerySnapshot> getMessages(String boardName) {
    return _db
        .collection('messages')
        .where('board', isEqualTo: boardName)
        .orderBy('datetime')
        .snapshots();
  }

  Future<void> sendMessage(Map<String, dynamic> messageData) {
    return _db.collection('messages').add(messageData);
  }
}
