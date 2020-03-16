import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Firestore _firestore = Firestore.instance;
final storageRef = FirebaseStorage.instance.ref();
final userRef = _firestore.collection('/users');
final restaurantRef = _firestore.collection('/restaurants');
final dishRef = _firestore.collection('/dishes');
