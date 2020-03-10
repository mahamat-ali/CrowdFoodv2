import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_food/models/user_model.dart';
import 'package:crowd_food/utilities/constants.dart';

class DatabaseService {
  final Firestore _firestore = Firestore.instance;

  Future<void> createUser({
    String uid,
    String name,
    String email,
    String profileImageUrl,
  }) async {
    return await _firestore.collection('/users').document(uid).setData(
      {
        'name': name,
        'email': email,
        'profileImageUrl': profileImageUrl,
      },
    );
  }

  updateUserProfile(User user) {
    userRef.document(user.id).updateData({
      'name': user.name,
      'bio': user.bio,
      'profileImageUrl': user.profileImageUrl
    });
  }
}
