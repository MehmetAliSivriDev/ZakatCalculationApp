import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:zakat_calculation_app/core/data/model/zakat_history_model.dart';

class DbHelper {
  String tblHistoryName = "history";
  String colHistoryId = "id";
  String colCalculateFrom = "calculate_from";
  String colCalculateTo = "calculate_to";
  String colAmountOfUser = "amount_of_user";
  String colValue = "value";
  String colAmountOfZakat = "amount_of_zakat";

  DbHelper._internal();
  static final DbHelper _dbHelper = DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await createDb();
    }
    return _db!;
  }

  Future<Database> createDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "zakat_calculate.db";
    var bursamDb = await openDatabase(path, version: 1, onCreate: create);
    return bursamDb;
  }

  void create(Database db, int version) async {
    await db.execute(
        "Create table $tblHistoryName ($colHistoryId integer primary key autoincrement,$colCalculateFrom text,$colCalculateTo text,$colAmountOfUser text,$colValue text,$colAmountOfZakat text)");
  }

  //QUERIES

  Future<int> zakatAdd(ZakatHistoryModel zakatModel) async {
    Database db = await this.db;
    var result = await db.insert(tblHistoryName, zakatModel.toJson());
    return result;
  }

  Future<int> zakatDelete(int id) async {
    Database db = await this.db;
    var result = await db
        .rawDelete("Delete from $tblHistoryName where $colHistoryId = $id");
    return result;
  }

  Future<int> zakatUpdate(ZakatHistoryModel zakatModel) async {
    Database db = await this.db;
    var result = db.update(tblHistoryName, zakatModel.toJson(),
        where: '$colHistoryId = ?', whereArgs: [zakatModel.id]);
    return result;
  }

  Future<List> getZakats() async {
    Database db = await this.db;
    var result = db.rawQuery("Select * from $tblHistoryName");
    return result;
  }

  //----------------------------------------------------------
}
