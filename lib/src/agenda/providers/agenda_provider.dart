
import 'package:agenda_app/src/agenda/db/db.dart';
import 'package:agenda_app/src/agenda/models/task_model.dart';
import 'package:flutter/material.dart';

class AgendaProvider with ChangeNotifier{

  late TaskModel currentTask;
  List<TaskModel> _listTask = [];
  final db = DbProvider.db;

  List<TaskModel> get getListTask => orderList();


  AgendaProvider(){
    loadTask();
  }

  List<TaskModel> orderList(){
    List<TaskModel> list = _listTask.toList();
    list.sort(( a, b ) => a.datetime.compareTo( b.datetime ));
    return list;
  }

  void createOrUpdateTask( TaskModel task ) async {

    final search = _listTask.indexOf( task );

    if( search == -1 ){
      _listTask.add( task );
      await db.newTask(task);
    }else{
      _listTask[ search ] = task;
      await db.updateTask(task);
    }

    notifyListeners();
  }

  void removeTask( TaskModel task ) async {
    await db.deleteTask(task);
    _listTask.removeWhere((element) => task == element );
    notifyListeners();
  }

  void loadTask() async {
    print('OBTIENDO TAREAS...');
    final tasks = await db.getAllTask();
    _listTask = [ ...tasks ];
    notifyListeners();
  }

}