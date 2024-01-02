import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app_practical_test_af/Helpers/DB_Helper/db_helper.dart';

class Firestore_Helper {
  Firestore_Helper._();

  static final Firestore_Helper firestore_helper = Firestore_Helper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addfavorite({required Map<String, dynamic> favorite_data}) async {
    await firestore
        .collection("Favourites")
        .doc("${DBHelper.note_id}")
        .set(favorite_data);
  }
}
