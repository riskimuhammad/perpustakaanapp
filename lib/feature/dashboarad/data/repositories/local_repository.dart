import 'package:bookapp/feature/dashboarad/data/model/dbbook_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class LocalRepository {
  Future<Database> opendatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'book.db');
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE book_tb (id INTEGER PRIMARY KEY AUTOINCREMENT, book_code VARCHAR(100), title VARCHAR(100), description VARCHAR(200), category VARCHAR(100))');
    });
    return database;
  }

  Future insert(DBBookModel dbBookModel) async {
    var database = await opendatabase();
    await database.transaction((txn) async {
      final data = await txn.rawInsert(
          "INSERT INTO book_tb(book_code,title,description,category) VALUES(?,?,?,?)",
          [
            dbBookModel.codeBook,
            dbBookModel.title,
            dbBookModel.description,
            dbBookModel.categpry
          ]);
      debugPrint('LIST BOOK DATA ${data}');
    });
  }

  Future edit(DBBookModel dbBookModel) async {
    var database = await opendatabase();
    await database.transaction((txn) async {
      final data = await txn.rawUpdate(
          "UPDATE book_tb SET title=? , description=? , category=? WHERE book_code =? ",
          [
            dbBookModel.title,
            dbBookModel.description,
            dbBookModel.categpry,
            dbBookModel.codeBook,
          ]);
      debugPrint('LIST BOOK DATA ${data}');
    });
  }

  Future get() async {
    var database = await opendatabase();
    final List<DBBookModel> listBook = [];
    await database.transaction((txn) async {
      final data = await txn.rawQuery('SELECT * FROM book_tb', []);
      for (var element in data) {
        listBook.add(DBBookModel.fromJson(element));
      }
    });
    return listBook;
  }

  Future delete(bookCode) async {
    var database = await opendatabase();
    await database
        .delete('book_tb', where: 'book_code = ?', whereArgs: [bookCode]);
  }
}
