import 'package:agenda_app/src/agenda/agenda_home_page.dart';
import 'package:agenda_app/src/balance/balance_home_page.dart';
import 'package:agenda_app/src/fruteria/pages/fr_started.dart';
import 'package:agenda_app/src/library/lib_home_page.dart';
import 'package:agenda_app/src/muebleria/pages/mueble_home_page.dart';
import 'package:agenda_app/src/pets/pet_home_page.dart';
import 'package:agenda_app/src/widgets/item_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Portafolio'),
      ),

      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children:  [

              ItemButton(
                title: 'Balance',
                lottieUrl: 'https://assets10.lottiefiles.com/private_files/lf30_kcohh4m7.json',
                backgroundColor: Colors.green.shade900,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const BalanceHomePage()));
                }, 
              ),

              const SizedBox(
                height: 15,
              ),
        
              ItemButton(
                title: 'Agenda App',
                lottieUrl: 'https://assets1.lottiefiles.com/packages/lf20_ZXvjFxGCy6.json',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const AgendaHomePage()));
                }, 
              ),
        
              const SizedBox(
                height: 15,
              ),
        
              ItemButton(
                title: 'Muebleria',
                lottieUrl: 'https://assets6.lottiefiles.com/packages/lf20_bfcbo83f.json',
                backgroundColor: Colors.indigo,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const MuebleHomePage()));
                }, 
              ),
        
              const SizedBox(
                height: 15,
              ),
        
              ItemButton(
                title: 'Fruteria',
                lottieUrl: 'https://assets10.lottiefiles.com/packages/lf20_nz20vA.json',
                backgroundColor: Colors.deepOrange,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const FrStartedPage()));
                }, 
              ),
        
              const SizedBox(
                height: 15,
              ),
        
              ItemButton(
                title: 'Pets',
                lottieUrl: 'https://assets10.lottiefiles.com/packages/lf20_syqnfe7c.json',
                backgroundColor: Colors.amber,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const PetHomePage()));
                }, 
              ),
        
              const SizedBox(
                height: 15,
              ),
        
              ItemButton(
                title: 'Libreria',
                lottieUrl: 'https://assets10.lottiefiles.com/packages/lf20_yg29hewu.json',
                backgroundColor: Colors.green.shade900,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const LibHomePage()));
                }, 
              ),

              const SizedBox(
                height: 15,
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
