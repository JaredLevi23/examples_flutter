import 'dart:io';

import 'package:agenda_app/src/agenda/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider{

  static Database? _database;
  static final DbProvider db = DbProvider._();
  DbProvider._();

  Future<Database> get database async{
    //if(_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async{

    //Path de donde se almacenara la base de datos

    Directory directory = await getApplicationDocumentsDirectory();
    final path = join( directory.path, 'Actividades.db' );
    
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db)async{
       
        await db.execute('''
        
        CREATE TABLE IF NOT EXISTS Actividades(
          id TEXT PRIMARY KEY,
          datetime TEXT,
          descripcion TEXT,
          tag TEXT
        )
        
        ''');

      },
      onCreate: ( Database db, int version )async{

        await db.execute('''
        
        CREATE TABLE IF NOT EXISTS Actividades(
          id TEXT PRIMARY KEY,
          datetime TEXT,
          descripcion TEXT,
          tag TEXT
        )
        
        ''');

      }
    );
  }

  Future<int> newTask( TaskModel task )async{
    final db = await database;
    final res = await db.insert('Actividades', task.toMap());
    return res;
  }

  Future<int> updateTask( TaskModel task ) async{
    final db = await database;
    final res = await db.update('Actividades', task.toMap(), where: 'id=?', whereArgs: [task.id]);
    return res;
  }

  Future<List<TaskModel>> getAllTask()async{

    final db = await database;
    final res = await db.query('Actividades');

    return res.isNotEmpty
      ? res.map((e) => TaskModel.fromMap(e)).toList()
      : [];
  }

  Future<int> deleteTask(TaskModel task)async{
    final db = await database;
    final res = db.delete('Actividades', where: 'id=?', whereArgs: [task.id]);
    return res;
  }

  Future<int> deleteTasks()async{
    final db = await database;
    final res = db.delete('Actividades');
    return res;
  }
  
}