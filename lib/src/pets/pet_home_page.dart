import 'package:flutter/material.dart';
import 'dart:math' as math;

class PetHomePage extends StatelessWidget {
const PetHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Column(
        children: [

          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            child: CustomPaint(
              painter: BackgroundPet(),
              child: Stack(
                children: [

                  Positioned(
                    top: 60,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        const Text(
                          'Homey',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),

                        Row(
                          children: [

                            const Text(
                              'Pet',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),

                            const SizedBox(
                              width: 5,
                            ),

                            Transform.rotate(
                              angle: math.pi * 0.2,
                              child: Icon( 
                                Icons.pets, color: Colors.amber.shade200, 
                              )
                            )

                          ],
                        )


                      ],
                    ),
                  ),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Image(image: AssetImage('assets/imgs/cat.png')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Take Care of\n Your Pet',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
            child: Column(
              children: [

                const Text(
                  'Make your bonding relationship',
                  style: TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  const Text(
                    'between ',
                    style: TextStyle(
                      fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),  

                  Text(
                    ' pets & humans',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.amber.shade800,
                      fontWeight: FontWeight.w800
                    ),
                    textAlign: TextAlign.center,
                  ),  

                  ],
                )

              ],
            ),
          ),

          const Spacer(),

          MaterialButton(
            padding: EdgeInsets.zero,
            color: Colors.amber.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 30 )
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only( top: 5.0, bottom: 5.0, left: 5.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon( Icons.arrow_forward_ios_sharp, color: Colors.amber.shade800, ),
                    ),
                  ),

                  const Expanded(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    )
                  )

                ],
              ),
            ),
            onPressed: (){}
          ),

          const Spacer(),

        ],
      ),

    );
  }
}


class BackgroundPet extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.amber.shade800
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo( 0, size.height * 0.95 );
    path.quadraticBezierTo( size.width * 0.5, size.height * 0.85, size.width, size.height * 0.95 );
    path.lineTo( size.width , 0 );
    path.lineTo( 0 , 0 );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


