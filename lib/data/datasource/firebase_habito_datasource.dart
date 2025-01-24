// -----------------------------------------------------------------------------
// 2. Data Source Concreta (Firebase Implementation)
// -----------------------------------------------------------------------------

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habito_2/data/datasource/i_habito_datasource.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';

class FirebaseHabitoDataSource implements HabitoDataSource {
  final FirebaseFirestore _firestore;
  final String _collectionName = 'habitos'; // Nome da coleção no Firestore

  FirebaseHabitoDataSource(this._firestore);

  @override
  Future<Habito> createHabito(Habito habito) async {
    final data = habito.toJson();

    DocumentReference docRef =
        await _firestore.collection(_collectionName).add(data);
    DocumentSnapshot snapshot = await docRef.get();

    if (!snapshot.exists) {
      throw Exception(
          'Falha ao criar hábito no Firestore'); // Melhor tratamento de erros
    }

    // Get data and Document ID, then merge them before parsing from JSON
    Map<String, dynamic> docData = snapshot.data() as Map<String, dynamic>;
    docData['id'] = snapshot.id; // Include the Firebase document ID
    return Habito.fromJson(docData);
  }

  @override
  Future<List<Habito>> getAllHabitos() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection(_collectionName).get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id; // Include the Firebase document ID
      return Habito.fromJson(data);
    }).toList();
  }

  @override
  Future<Habito?> getHabitoById(String id) async {
    final DocumentSnapshot documentSnapshot =
        await _firestore.collection(_collectionName).doc(id).get();

    if (!documentSnapshot.exists) {
      return null; // Hábito não encontrado
    }

    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    data['id'] = documentSnapshot.id; // Include the Firebase document ID
    return Habito.fromJson(data);
  }

  @override
  Future<Habito> updateHabito(Habito habito) async {
    if (habito.id.toString().isEmpty) {
      throw ArgumentError(
          "Hábito ID cannot be null or empty for update operation in Firebase.");
    }

    final data = habito.toJson();

    await _firestore.collection(_collectionName).doc(habito.uuid).update(data);

    return habito; // For simplicity, return the updated Habito object as it's already updated locally
  }

  @override
  Future<void> deleteHabito(String id) async {
    await _firestore.collection(_collectionName).doc(id).delete();
  }

  @override
  Future<List<Habito>> getConcluidos() async {
    final QuerySnapshot querySnapshot = await _firestore
        .collection(_collectionName)
        .where('completed_dates', isNotEqualTo: []).get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id; // Include the Firebase document ID
      return Habito.fromJson(data);
    }).toList();
  }
}
