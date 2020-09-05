import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection{

  static const VERSION = 1;
  static const DATABASE_NAME = 'sigleton_flutter_teste';

  Database _db;
  static Connection _instance;

  Connection._();

  static Connection get instace{
    _instance ??= Connection._();
    return _instance;
  }

  Future<Database> get db => _openDatabaseConnection();

  Future<Database> _openDatabaseConnection() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, DATABASE_NAME);
    if(_db ==null){
      _db = await openDatabase(
        path,
        version: VERSION,
        onCreate: _onCreate, // Quando o usuario baixa o aplicativo e realiza a primeira configuração, cria a versao 1 do banco de dados.
        onUpgrade: _onUpdgrade, // Caso o banco já exista atualiza
      );
    }
    return _db;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute('create table teste(nome varchar(200))');
    db.execute('insert into teste values("Carlos Silva")');
    db.execute('insert into teste values("Simone Silva")');
    db.execute('insert into teste values("Rodrigo Rahman")');
  }

  FutureOr<void> _onUpdgrade(Database db, int oldVersion, int newVersion) {
  }

  Future<void> closeConnection() async{
    print('Fechou a conexão!!!!');
    await _db.close();
    _db = null;
  }
}