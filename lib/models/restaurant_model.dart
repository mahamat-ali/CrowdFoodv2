import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  String id, name, email, imageUrl;

  Restaurant({
    this.id,
    this.name,
    this.email,
    this.imageUrl,
  });

  factory Restaurant.fromDoc(DocumentSnapshot doc) {
    return Restaurant(
      id: doc.documentID,
      name: doc['name'],
      email: doc['email'],
      imageUrl: doc['imageUrl'] ?? '',
    );
  }
}
