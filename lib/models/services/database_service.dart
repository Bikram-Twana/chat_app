import 'package:chat_app/models/user/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;
  String dbName = 'chat_app.db';
  String tableUser = 'TableUser';
  String tableChatHistory = 'TableChatHistory';
  DatabaseService._init();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await _initDB(dbName);

    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // const realType = 'REAL NOT NULL';
    const textType = 'TEXT NOT NULL';
    const idType = 'TEXT PRIMARY KEY';

    String sql = ''' 
        CREATE TABLE $tableUser(
          email $idType,
          userName $textType,
          fullName $textType,
          phoneNumber $textType,
          password $textType,
          images TEXT
          
        )
    ''';
    await db.execute(sql);
  }

  //Get All UserModels
  Future<List<UserModel>> getAllUserModels() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db!.query(tableUser);
    return List.generate(
        maps.length,
        (index) => UserModel(
            email: maps[index]['email'],
            userName: maps[index]['userName'],
            fullName: maps[index]['fullName'],
            phoneNumber: maps[index]['phoneNumber'],
            password: maps[index]['password'],
            image: maps[index]['images'])).toList();
  }

  //Adding Single UserModel
  Future<void> addUser(UserModel user) async {
    final db = await database;
    await db?.insert(tableUser, user.toJson());
  }

  //Get Single UserModel
  Future<List<Map<String, dynamic>>> getSingleUser(
      String email, String password) async {
    // final userData = {"email": email, "password": password};
    try {
      final db = await database;

      return db!.rawQuery(
          'SELECT * FROM TableUser WHERE email=? and password=? limit 1;',
          [email, password]);
      // db!

      //     .query('TableUser', where: "email = ?", whereArgs: [email], limit: 1);
    } catch (e) {
      throw ("Error in getting user");
    }
  }

  // Add Profile Image To Users
  // Future<void> addProfileImage(String imagePath){
  //   try{
  //     final db = await database;
  //     db!.rawQuery("INSERT ");
  //   }
  // }
  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}
