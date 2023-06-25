import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static final String tableName = 'cards';

  static Database? _database;

  DatabaseHelper._privateConstructor();  //yalnızca instance üzerinden erişim (ekleme,silme,güncelleme)

  Future<Database> get database async {
    if (_database != null) {
      return _database!;              //mevcut veritabanı başlatma
    }

    _database = await _initDatabase();   // veri tabanı başlatma
    return _database!;
  }

  Future<Database> _initDatabase() async {    
    String path = join(await getDatabasesPath(), 'card_application.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        cardNumber TEXT PRIMARY KEY,
        name TEXT,
        cvv TEXT,
        iban TEXT,
        expiryDate TEXT
      )
    ''');
  }

  Future<int> insertCard(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getCards() async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future<int> deleteCard(String cardNumber) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: 'cardNumber = ?', whereArgs: [cardNumber]);
  }
}


class CardInfo {
  final String name;
  final String cardNumber;
  final String cvv;
  final String iban;
  final String expiryDate;

  CardInfo(this.name, this.cardNumber, this.cvv, this.iban, this.expiryDate);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cardNumber': cardNumber,
      'cvv': cvv,
      'iban': iban,
      'expiryDate': expiryDate,
    };
  }

  static CardInfo fromMap(Map<String, dynamic> map) {
    return CardInfo(
      map['name'],
      map['cardNumber'],
      map['cvv'],
      map['iban'],
      map['expiryDate'],
    );
    
  }
}
