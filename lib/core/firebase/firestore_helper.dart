import 'package:cloud_firestore/cloud_firestore.dart';

class FireStorageHelper {
  FirebaseFirestore? _firestore;
  static FireStorageHelper? _instance;

  FireStorageHelper._internal() {
    _firestore = FirebaseFirestore.instance;
  }

  static FireStorageHelper get shared {
    _instance ??= FireStorageHelper._internal();
    return _instance!;
  }

  FirebaseFirestore? get firestore => _firestore;
}
