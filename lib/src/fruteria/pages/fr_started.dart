import 'package:agenda_app/src/fruteria/pages/fr_home_page.dart';
import 'package:agenda_app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FrStartedPage extends StatelessWidget {
const FrStartedPage({ Key? key }) : super(key: key);

  // jitomate pendulo
  //https://assets10.lottiefiles.com/packages/lf20_zkhpkpyc.json

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(251, 243, 221, 1 ),
              Color.fromRGBO(250, 245, 230, 1 ),
              Color.fromRGBO(234, 244, 208, 1 ),
            ]
          )
        ),
        padding: const EdgeInsets.all( 30 ),
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.65 ,
              child: Lottie.network( 
                'https://assets10.lottiefiles.com/packages/lf20_HuacmAHmsK.json',
                fit: BoxFit.scaleDown
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  color: Colors.black,
                  margin: const EdgeInsets.only( right: 10 ),
                ),

                Container(
                  width: 9,
                  height: 9,
                  color: Colors.black,
                  margin: const EdgeInsets.only( right: 10 ),
                ),

                Container(
                  width: 50,
                  height: 10,
                  color: Colors.black,
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            const Text(
              'Grocery Shop',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),

            const Text(
              'El camino sencillo para adquirir',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87
              ),
            ),

            const Text(
              'tus compras de frutas',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            CustomButton(
              label: 'Comenzar',
              backgroundColor: const Color.fromRGBO(251, 185, 93, 1),
              onPressed: (){

                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_) => const FrHomePage() )
                );

              },
            ),

            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}