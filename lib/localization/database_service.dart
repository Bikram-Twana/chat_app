import 'package:new_chat_app/features/chat_feature/domain/models/chat_model.dart';
import 'package:new_chat_app/features/login_register/domain/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;
  String dbName = 'chat_app.db';
  String tableUser = 'UserTable';
  String tableChat = 'ChatTable';

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
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // const realType = 'REAL NOT NULL';
    const textType = 'TEXT NOT NULL';

    // TableUser
    String sql = ''' 
        CREATE TABLE $tableUser(
	        id	INTEGER PRIMARY KEY AUTOINCREMENT,
          email $textType,
          userName $textType,
          fullName $textType,
          phoneNumber $textType,
          password $textType, 
          userImage TEXT
        )
    ''';

    // chatTable
    String sql2 = '''
      CREATE TABLE $tableChat (
	    id	INTEGER UNIQUE,
	    senderEmail	TEXT NOT NULL,
	    receiverEmail	TEXT NOT NULL,
	    message	TEXT,
      imageMessage TEXT,
	    datetime	TEXT NOT NULL,
	    PRIMARY KEY("id" AUTOINCREMENT)
    )
    ''';
    await db.execute(sql);

    await db.execute(sql2);
  }

  // Get All UserModels
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
          userImage: maps[index]['userImage']),
    ).toList();
  }

  // Adding Single UserModel
  Future<void> addUser(UserModel user) async {
    final db = await database;
    await db?.insert(tableUser, user.toJson());
  }

  // Get Single UserModel
  Future<List<Map<String, dynamic>>> getSingleUser(
      String email, String password) async {
    // final userData = {"email": email, "password": password};
    try {
      final db = await database;

      return db!.rawQuery(
          'SELECT * FROM UserTable WHERE email=? and password=? limit 1;',
          [email, password]);
      // db!

      //     .query('TableUser', where: "email = ?", whereArgs: [email], limit: 1);
    } catch (e) {
      throw ("Error in getting user");
    }
  }

  // // Add Profile Image To Users
  // Future<void> addProfileImage(String imagePath, String userEmail) async {
  //   try {
  //     final db = await database;
  //     // db!.rawQuery('ALTER TABLE $tableUser ADD image TEXT');
  //     db!.rawQuery(
  //         'UPDATE userTable set image = $imagePath where email = $userEmail;');
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // Getting all receiving users in chat list
  Future<List<Map<String, dynamic>>> allReceivingUsers(
      String exceptEmail) async {
    try {
      final db = await database;
      return await db!
          .rawQuery('SELECT * FROM $tableUser WHERE email !="$exceptEmail";');
    } catch (e) {
      throw ('No Receiving Users Found');
    }
  }

  // Get All ChatModels
  Future<List<ChatModel>> getAllChatModels() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db!.query(tableChat);
    return List.generate(
      maps.length,
      (index) => ChatModel(
          senderEmail: maps[index]['senderEmail'],
          receiverEmail: maps[index]['receiverEmail'],
          message: maps[index]['message'] ?? "",
          imageMessage: maps[index]['imageMessage'] ?? "",
          datetime: maps[index]['datetime']),
    ).toList();
  }

  // Adding Single ChatModel When message is sent
  Future<void> addMessage(ChatModel chat) async {
    final db = await database;
    await db?.insert(tableChat, chat.toJson());
  }

  // Chats history between two parties
  Future<List<Map<String, dynamic>>> getMessage(
      String loggedUserEmail, String otherUserEmail) async {
    try {
      final db = await database;
      return db!.rawQuery(
          'SELECT tc.id, tc.message AS message, tc.imageMessage AS image, tc.senderEmail AS senderEmail, tc.receiverEmail, tc.datetime, tu.userImage FROM $tableChat tc INNER JOIN $tableUser tu ON tc.receiverEmail = tu.email WHERE (tc.senderEmail = "$loggedUserEmail" AND tc.receiverEmail  = "$otherUserEmail") OR (tc.receiverEmail = "$loggedUserEmail" AND tc.senderEmail = "$otherUserEmail") ORDER BY tc.datetime DESC;');
    } catch (e) {
      throw ("Error in getting chats");
    }
  }

  // // Get usermodel from id
  // Future<List<Map<String, dynamic>>> getUserModelFromId(int id) async {
  //   try {
  //     final db = await database;
  //     final List<Map<String,dynamic>> maps =  db
  //         .rawQuery('SELECT * FROM $tableUser WHERE id = $id');
  //     return List.generate(maps.length, (index) {
  //     return UserModel.fromJson(maps[index]);
  //   });
  //   } catch (e) {
  //     throw ("No user");
  //   }
  // }

  //Get usermodel from id
  Future<List<Map<String, dynamic>>> getUserModelFromId(int id) async {
    try {
      Database? db = await database;
      final List<Map<String, dynamic>> maps =
          await db!.rawQuery(''' SELECT * FROM $tableUser WHERE id=$id''');

      // return List.generate(maps.length, (index) {
      //   return jsonDecode(jsonEncode(maps[index]));
      // });
      return maps;
    } catch (e) {
      throw ("No user");
    }
  }

  // Get singel chatmodel from email
  Future<List<Map<String, dynamic>>> getSingleChatModel(String email) async {
    try {
      final db = await database;
      return db!.rawQuery(
          'SELECT * FROM $tableChat WHERE $tableChat.receiverEmail = "email";');
    } catch (e) {
      throw ("No model found");
    }
  }

  // // Insert User to ChatList from registration username
  // Future<List<Map<String, dynamic>>> insertInChatList(String userName) async {
  //   try {
  //     final db = await database;
  //     return db!.query(
  //         'SELECT * FROM $tableChat ct INNER JOIN $tableUser ut ON ct.receiverEmail = ut.email Where ut.userName = "$userName"');
  //   } catch (e) {
  //     throw ("No id found");
  //   }
  // }

  // Closing db
  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}
