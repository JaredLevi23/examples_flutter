
import 'dart:convert';

class TaskModel{
  String? id;
  DateTime datetime;
  String descripcion;
  String tag;

  TaskModel({
    required this.datetime,
    required this.descripcion,
    required this.tag,
    this.id
  });

  factory TaskModel.fromJson( String str ) => TaskModel.fromMap( json.decode( str ) );

  String toJson() => json.encode( toMap() );

  factory TaskModel.fromMap( Map<String, dynamic> json ) => TaskModel(
    id: json["id"],
    datetime: DateTime.parse( json["datetime"] ), 
    descripcion: json["descripcion"], 
    tag: json["tag"]
  );


  Map<String, dynamic> toMap() => {
    "id": id,
    "datetime": datetime.toString(), 
    "descripcion": descripcion, 
    "tag": tag   
  };

}