import 'package:agenda_app/src/agenda/agenda_create_page.dart';
import 'package:agenda_app/src/agenda/providers/agenda_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AgendaDetailsPage extends StatelessWidget {
  const AgendaDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final agendaProvider = Provider.of<AgendaProvider>(context);
    final currentTask = agendaProvider.currentTask;

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Detalle' ),
      ),

      body: Container(
        margin: const EdgeInsets.all( 50 ),
        padding: const EdgeInsets.all( 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 20 ),
          border: Border.all( 
            color: Colors.deepPurple,
            width: 2
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon( Icons.edit_note_rounded ),
                  splashColor: Colors.indigo,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_)=> const AgendaCreatePage())
                    );
                  }, 
                ),
                IconButton(
                  splashColor: Colors.red,
                  icon: const Icon( Icons.delete_outline ),
                  onPressed: (){

                    showDialog(
                      context: context, 
                      builder: (_) => AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: Container(
                          height: 200,
                          child: Stack(
                            children: [

                              Positioned(
                                top: 90,
                                child: Container(
                                  padding: const EdgeInsets.only( top: 30, left: 15, right: 15 ),
                                  height: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular( 15 ),
                                    color: Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                      const Text('¿Desea eliminar esta nota?', style: TextStyle( fontSize: 20 ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            child: const Text('Si'),
                                            onPressed: (){
                                              agendaProvider.removeTask( currentTask );
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            }, 
                                          ),
                                          TextButton(
                                            child: const Text('No'),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            }, 
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( 2 ),
                                    child: SvgPicture.asset( currentTask.tag ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    );

                  }, 
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text( 
                    'Tag', 
                    style: TextStyle( 
                      fontSize: 20 ,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SvgPicture.asset(
                    currentTask.tag,
                    width: 150,
                    height: 150,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Text(
                    agendaProvider.currentTask.datetime.toString().split(' ')[0],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  const Text( 
                    'Descripcion', 
                    style: TextStyle( 
                      fontSize: 20 ,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Text( 
                    currentTask.descripcion,
                    textAlign: TextAlign.justify,
                    style: const TextStyle( 
                      fontSize: 20
                    ),
                  )
                  ],
                ),
              )
            )

          ],
        ),
      ),
    );
  }
}