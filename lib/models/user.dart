import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String phone_no;
  final String uid;

  const User({
    required this.email,
    required this.phone_no,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone_no": phone_no,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        email: snapshot['email'],
        phone_no: snapshot['phone_no'],
        uid: snapshot['uid']);
  }
}
