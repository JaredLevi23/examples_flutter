import 'package:agenda_app/src/muebleria/utils/gradients.dart';
import 'package:flutter/material.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only( top: 40, left: 20, right: 20 ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: Gradients.stepsColorListHome,
          colors: Gradients.gradientColorListHome
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          IconButton( 
            icon: const Icon( Icons.menu ), 
            color: Colors.white,
            iconSize: 30,
            onPressed: (){
              print('MENU');
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton( 
                icon: const Icon( Icons.search ), 
                color: Colors.white,
                iconSize: 30,
                onPressed: (){},
              ),
              IconButton( 
                icon: const Icon( Icons.favorite ), 
                color: Colors.white,
                iconSize: 30,
                onPressed: (){},
              ),
              IconButton( 
                icon: const Icon( Icons.more_vert ), 
                color: Colors.white,
                iconSize: 30,
                onPressed: (){},
              ),
            ],
          )

        ],
      ),
    );
  }
}