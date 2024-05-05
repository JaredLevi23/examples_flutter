import 'package:agenda_app/src/agenda/models/task_model.dart';
import 'package:agenda_app/src/agenda/agenda_create_page.dart';
import 'package:agenda_app/src/agenda/agenda_details_page.dart';
import 'package:agenda_app/src/agenda/providers/agenda_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AgendaHomePage extends StatelessWidget {
  const AgendaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final agendaProvider = Provider.of<AgendaProvider>(context);

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      
              const Text(
                'Mis Tareas', 
                style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold ),
              ),

              const SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  _TaskButton(
                    label: 'Crear Tarea',
                    iconData: Icons.edit_calendar_outlined,
                    onPressed: (){

                      final uuid = Uuid();

                      agendaProvider.currentTask = TaskModel(
                        id: uuid.v4(),
                        datetime: DateTime.now(), 
                        descripcion: '', 
                        tag: 'assets/svg/s1.svg'
                      );

                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (_)=> const AgendaCreatePage() )
                      );
                    }
                  ),

                  _TaskButton(
                    label: 'Todas',
                    backgroundColor: Colors.deepPurple,
                    iconData: Icons.list_alt,
                    onPressed: (){},
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              const Text(
                'Pendientes', 
                style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: agendaProvider.getListTask.length,
                  itemBuilder: (_, index){

                    final task = agendaProvider.getListTask[ index ];
                    final time = DateTime.now().difference( task.datetime ).inDays;

                    return Container(
                      margin: const EdgeInsets.symmetric( vertical: 10),
                      child: MaterialButton(
                        height: 120,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular( 20 )
                        ),
                        onPressed: (){
                          agendaProvider.currentTask = task;
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (_)=> const AgendaDetailsPage())
                          );
                        },
                        child: Row(
                          children: [

                            SizedBox(
                              width: 100,
                              height: 100,
                              child: SvgPicture.asset( task.tag ),
                            ),

                            const SizedBox(
                              width: 10,
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( task.descripcion, maxLines: 3, overflow: TextOverflow.ellipsis, ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon( Icons.nightlight_outlined ),
                                      Text( 
                                        task.datetime.toString().split(' ')[0],
                                         style: const TextStyle( color: Colors.grey ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular( 15 ),
                                          color: Colors.green.shade50,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Faltan $time dias',
                                            style: TextStyle( 
                                              fontSize: 10, 
                                              color: time < 0 
                                                ? const Color.fromARGB(255, 68, 144, 71) 
                                                : Colors.red
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            )
                            
                          ],
                        ),
                      ),
                    );
                  }
                )
              )
      
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskButton extends StatelessWidget {

  final Function()? onPressed;
  final String label;
  final IconData iconData;
  final Color? backgroundColor;
  final Color? fontColor;

  const _TaskButton({
    Key? key, 
    required this.onPressed, 
    required this.label, 
    required this.iconData, 
    this.backgroundColor, 
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      color: backgroundColor ?? Colors.orange.shade700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 15 )
      ),
      child: Container(
        padding: const EdgeInsets.all( 15 ),
        width: MediaQuery.of(context).size.width / 2.3,
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon( iconData , color: Colors.white, size: 60, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                
                Expanded(
                  child: Text( 
                    label, 
                    style: TextStyle( 
                      fontSize: 19, 
                      color: fontColor ?? Colors.white 
                    ),
                  )
                ),

                const SizedBox(
                  width: 60,
                  child: Icon( 
                    Icons.arrow_circle_right_rounded, 
                    size: 50, 
                    color: Colors.white
                  )
                )
              ],
            )
          ],
        ),
      ),
      onPressed: onPressed
    );
  }
}