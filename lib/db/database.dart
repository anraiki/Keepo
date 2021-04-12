import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:easybee/db/model/beeTransaction.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if(_database != null)
    return _database;

    _database = await initDB();
    return _database;
  } 

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'easyBKeeping'),
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE transactions (
              id INT PRIMARY KEY,
              name TEXT,
              createdAt TEXT,
              updatedAt TEXT
            )
        ''');
      },
      version: 1
    );
  }

  transactionAdd( String name ) async {
    final db      = await database;
    DateTime now  = new DateTime.now();
    var checkID   = await db.rawQuery("SELECT * FROM transactions ORDER BY id DESC LIMIT 0, 1");
    int id        = checkID.length == 0 ? 1 : checkID[0] ;
    
    var res = await db.rawInsert(
      'INSERT INTO transactions (id, name, createdAt, updatedAt) VALUES (?, ?, ?, ?)', 
      [id, name, now.toLocal(), now.toLocal()]
    );
    
    return res;
  }

  Future<dynamic> getTransactions() async {
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM transactions ORDER BY `id` DESC");
    if( res.length == 0 ) {
      return null;
    } else {
      return res;
    }
  }


}
