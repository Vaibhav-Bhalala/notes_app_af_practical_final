import 'package:notes_app_practical_test_af/modules/Model/notes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbhelper = DBHelper._();

  static Database? database;
  static String note_table = "note_table";
  static String note_id = "id";
  static String note_title = "title";
  static String notes = "notes";

  initDB() async {
    String db_Path = join(await getDatabasesPath(), 'rwn.db');

    database = await openDatabase(db_Path, version: 1,
        onCreate: (Database db, _) async {
      String query =
          "CREATE TABLE IF NOT EXISTS $note_table($note_id INTEGER PRIMARY KEY AUTOINCREMENT,$note_title TEXT NOT NULL,$notes TEXT NOT NULL);";
      await db.execute(query);
    });
  }

  Future<int?> insertnote({required Notes note_data}) async {
    await initDB();
    String query = "INSERT INTO $note_table($note_title,$notes) VALUES(?,?)";
    List args = [note_data.title, note_data.notes];
    int? res = await database?.rawInsert(query, args);
    return res;
  }

  Future<List<Notes>> fetchNotesData() async {
    await initDB();
    String query = "SELECT * FROM $note_table;";
    List<Map<String, dynamic>> fetchedData = await database!.rawQuery(query);
    List<Notes> fetchedNotes =
        fetchedData.map((e) => Notes.fromSQL(data: e)).toList();
    return fetchedNotes;
  }

  Future<int?> deleteNotes({required int id}) async {
    await initDB();
    String query = "DELETE FROM $note_table WHERE $note_id=$id;";
    int? res = await database?.rawDelete(query);
    return res;
  }
}
