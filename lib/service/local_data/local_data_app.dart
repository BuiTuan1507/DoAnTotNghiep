
import 'package:do_an/models/user/user_model.dart';

import 'package:sqflite/sqflite.dart' as sql;

class MoneyManageDB {
  static late sql.Database moneyDB;
  // get instance db
  static Future<sql.Database> database() async {
    //  if (moneyDB != null) return moneyDB;

    // if _database is null we instantiate it
    moneyDB = await db();
    return moneyDB;
  }

  //create Table
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE user(
        idDb INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        id INTEGER,
        firstName TEXT,
        lastName TEXT,
        token TEXT,
        avatar TEXT,
        phoneNumber TEXT
      )
      """);
  }

  //open db
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'doan.db',
      version: 2,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // insert Item
  static Future<int> createItem(UserModel userModel) async {
    final db = await database();

    final data = {
      'id': userModel.id,
      'firstName': userModel.firstName,
      'lastName': userModel.lastName,
      'token': userModel.token,
      'avatar': userModel.avatar,
      'phoneNumber': userModel.phoneNumber
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // read all item
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database();
    return db.query('items', orderBy: "idDb");
  }

  // read single items
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await database();
    return db.query('items', where: "idDb = ?", whereArgs: [id], limit: 1);
  }

  // update item by id
  static Future<int> updateItem(UserModel userModel, int id) async {
    final db = await database();

    final data = {
      'id': userModel.id,
      'firstName': userModel.firstName,
      'lastName': userModel.lastName,
      'token': userModel.token,
      'avatar': userModel.avatar,
      'phoneNumber': userModel.phoneNumber
    };
    final result =
    await db.update('items', data, where: "idDb = ?", whereArgs: [id]);
    return result;
  }

  // delete item by id
  static Future<void> deleteItem(int id) async {
    final db = await database();
    try {
      await db.delete("items", where: "idDb = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}

