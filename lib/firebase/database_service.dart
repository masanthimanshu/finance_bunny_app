import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

mixin DatabaseService {
  final _db = FirebaseFirestore.instance;

  @protected
  Future<void> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db.collection(collection).add(
        {...data, "timestamp": FieldValue.serverTimestamp()},
      );
    } catch (e) {
      debugPrint("Error adding document - $e");
    }
  }

  @protected
  Future<void> createDocument({
    required String document,
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db.collection(collection).doc(document).set(
        {...data, "timestamp": FieldValue.serverTimestamp()},
        SetOptions(merge: true),
      );
    } catch (e) {
      debugPrint("Error creating document - $e");
    }
  }

  @protected
  Future<List<Map<String, dynamic>>> getCollectionData(
    String collection,
  ) async {
    final res = await _db.collection(collection).get();

    if (res.docs.isNotEmpty) return res.docs.map((e) => e.data()).toList();
    return [];
  }

  @protected
  Future<Map<String, dynamic>?> getDocumentData({
    required String collection,
    required String document,
  }) async {
    final res = await _db.collection(collection).doc(document).get();
    return res.data();
  }

  @protected
  Future<List<Map<String, dynamic>>> getFilteredData({
    required String field,
    required String value,
    required String collection,
  }) async {
    final query = _db.collection(collection).where(field, isEqualTo: value);
    final res = await query.get();

    final allData = res.docs.map((e) => e.data()).toList();
    return allData;
  }

  @protected
  Stream<List<Map<String, dynamic>>> getCollectionStream(String collection) {
    final res = _db.collection(collection).snapshots();

    final data = res.map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });

    return data;
  }

  @protected
  Stream<Map<String, dynamic>?> getDocumentStream({
    required String document,
    required String collection,
  }) {
    final data = _db.collection(collection).doc(document).snapshots();
    return data.map((snapshot) => snapshot.data());
  }

  @protected
  Stream<List<Map<String, dynamic>>> getFilteredStream({
    required String field,
    required String value,
    required String collection,
  }) {
    final res = _db.collection(collection).where(field, isEqualTo: value);

    final data = res.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });

    return data;
  }
}
