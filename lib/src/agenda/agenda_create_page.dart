
import 'package:agenda_app/src/agenda/providers/agenda_provider.dart';
import 'package:agenda_app/src/utils/ui/input_decorations.dart';
import 'package:agenda_app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AgendaCreatePage extends StatefulWidget {
  const AgendaCreatePage({Key? key}) : super(key: key);

  @override
  State<AgendaCreatePage> createState() => _AgendaCreatePageState();
}

class _AgendaCreatePageState extends State<AgendaCreatePage> {

  String tag = '';

  @override
  Widget build(BuildContext context) {

    final agendaProvider = Provider.of<AgendaProvider>(context);
    final currentTask = agendaProvider.currentTask;
    tag = currentTask.tag;

    return Scaffold(

      appBar: AppBar(
        title: const Text('Tarea'),
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all( 10 ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text('Tag', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),

                const SizedBox(
                  height: 5,
                ),

                const _TagMenu(),

                const SizedBox(
                  height: 25,
                ),
          
                const Text('Selecciona Fecha', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),
                GestureDetector(
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecorations.taskDecoration(
                      hintText: 'Fecha: ${ currentTask.datetime.toString().split(' ')[0] }'
                    )
                  ),
                  onTap: ()async{
                    final DateTime? date = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(), 
                      firstDate: DateTime( 2022, 01, 01 ), 
                      lastDate: DateTime( 2025, 12, 31 )
                    );
          
                    if( date != null ){
                      currentTask.datetime = date;
                      setState(() {}); 
                    }                  
                  },
                ),
          
                const SizedBox(
                  height: 25,
                ),
          
                const Text('Descripcion', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17 ),),

                TextFormField(
                  initialValue: currentTask.descripcion,
                  maxLines: 10,
                  decoration: InputDecorations.taskDecoration(
                    hintText: 'Descripcion'
                  ),
                  onChanged: ( value )=> currentTask.descripcion = value,
                ),

                const SizedBox(
                  height: 25,
                ),

                CustomButton(
                  label: 'Guardar',
                  onPressed: (){
                    agendaProvider.createOrUpdateTask( currentTask );
                    Navigator.pop(context);
                  },
                )

              ],
            ),
          ),
        )
      ),


    );
  }
}


class _TagMenu extends StatefulWidget {
  const _TagMenu({ Key? key }) : super(key: key);

  @override
  _TagMenuW createState() => _TagMenuW();
}

class _TagMenuW extends State<_TagMenu> {
  
  @override
  Widget build(BuildContext context) {

    final agendaProvider = Provider.of<AgendaProvider>(context);

    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.all( 5 ),
      decoration: BoxDecoration(
        border: Border.all( width: 2, color: Colors.deepPurple ),
        borderRadius: BorderRadius.circular( 20 )
      ),
      child: DropdownButton<Object>(
        underline: const SizedBox(),
        value: agendaProvider.currentTask.tag,
        items: getItems(),
        onChanged: ( value ){
          agendaProvider.currentTask.tag = value.toString();
          setState(() {});
        }
      ),
    );
  }

  List<DropdownMenuItem<Object>> getItems(){
    final List values = [
        {
          "asset": 'assets/svg/s1.svg', 
          "label": 'Ciudad',
        },
        {
          "asset": 'assets/svg/s2.svg', 
          "label": 'Desierto',
        },
        {
          "asset": 'assets/svg/s3.svg', 
          "label": 'Marea',
        },
        {
          "asset": 'assets/svg/s4.svg', 
          "label": 'Cascada',
        },
        {
          "asset": 'assets/svg/s5.svg', 
          "label": 'Runas',
        },
        {
          "asset": 'assets/svg/s6.svg', 
          "label": 'Olas',
        },
        {
          "asset": 'assets/svg/s7.svg', 
          "label": 'Cosecha',
        },
        {
          "asset": 'assets/svg/s8.svg', 
          "label": 'Montaña',
        },
        {
          "asset": 'assets/svg/s9.svg', 
          "label": 'Bosque',
        },
        {
          "asset": 'assets/svg/s10.svg', 
          "label": 'Acantilado',
        },
    ];

    return values.map(
      (e) => DropdownMenuItem(
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: SvgPicture.asset( 
                  e["asset"] ,
                  fit: BoxFit.cover,
                ),
              ),
              Text( e["label"] ),
            ],
          ),
        value: e["asset"],
      )
    ).toList();
  }


}