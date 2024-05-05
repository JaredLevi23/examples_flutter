import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ButtonGif extends StatelessWidget {
  const ButtonGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      color: Colors.indigo,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 15 )
      ),
      child: Container(
        padding: const EdgeInsets.symmetric( horizontal: 15 ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Lottie.network(
                'https://assets1.lottiefiles.com/packages/lf20_ZXvjFxGCy6.json',
              )
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Crear Tarea', style: TextStyle( fontSize: 18, color: Colors.white),),
                  Icon(Icons.add, color: Colors.white,)
                ],
              ),
            ),
          ],
        ),
      ),
      onPressed: (){
      
      }
    );
  }
}