import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_food/models/dish_model.dart';
import 'package:crowd_food/models/restaurant_model.dart';
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

  Stream<List<Restaurant>> get restaurants {
    return restaurantRef.snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return Restaurant(
          id: doc.documentID,
          name: doc.data['name'],
          email: doc.data['email'],
          imageUrl: doc.data['imageUrl'],
        );
      }).toList();
    });
  }

  Stream<List<Dish>> get dishes {
    return dishRef.snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return Dish(
          id: doc.documentID,
          restoId: doc['restoId'],
          name: doc['name'],
          description: doc['description'],
          imageUrl: doc['imageUrl'] ?? '',
          price: doc['price'],
          featured: doc['featured'] ?? false,
        );
      }).toList();
    });
  }
}
