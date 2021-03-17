import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Services {
  final Firestore _servicesDB = Firestore.instance;
  final String path;

  CollectionReference reference;
  Services(this.path) {
    reference = _servicesDB.collection(path);
  }

  Future<QuerySnapshot> getDataHotels() {
    return reference.getDocuments();
  }

  Stream<QuerySnapshot> streamDataHotels() {
    return reference.snapshots();
  }

  Future<DocumentSnapshot> getHotelsById(String id) {
    return reference.document(id).get();
  }

  Future<void> delHotels(String id) {
    return reference.document(id).delete();
  }

  Future<DocumentReference> addHotels(Map data) {
    return reference.add(data);
  }

  Future<void> updateHotels(Map data, String id) {
    return reference.document(id).updateData(data);
  }
}
