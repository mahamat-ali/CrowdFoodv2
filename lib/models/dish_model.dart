import 'package:cloud_firestore/cloud_firestore.dart';

class Dish {
  String id, restoId, name, description, imageUrl;
  double price;
  bool featured;

  Dish({
    this.id,
    this.restoId,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.featured,
  });

  factory Dish.fromDoc(DocumentSnapshot doc) {
    return Dish(
      id: doc.documentID,
      restoId: doc['restoId'],
      name: doc['name'],
      description: doc['description'],
      imageUrl: doc['imageUrl'] ?? '',
      price: doc['price'],
      featured: doc['featured'] ?? false,
    );
  }
}
