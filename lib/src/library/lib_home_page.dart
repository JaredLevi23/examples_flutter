import 'package:agenda_app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LibHomePage extends StatelessWidget {
const LibHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(11,75,52,1),
      body: Stack(
        children: [

          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: BackgroundBorrow(),
              child: Column(
                children: [

                  const Spacer(),

                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.38,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO( 207,254,238,1 ),
                      shape: BoxShape.circle
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all( 15 ),
                    child: const Text(
                      'Borrow & enjoy!',
                      style: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),


                  const SizedBox(
                    height: 30,
                  ),

                  Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.black12,
                    child: const Center(
                      child: Text(
                        'Algun texto que va aqui',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),


                  Container(
                    margin: const EdgeInsets.all( 20 ),
                    height: 60,
                    child: CustomButton(
                      label: 'Get Started',
                      labelColor: Colors.green.shade900,
                      backgroundColor: Colors.white,
                      
                      onPressed: (){},
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  )

                ],
              ),
            ),
          )



        ],
      )

    );
  }
}


class BackgroundBorrow extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint()
      ..color = const Color.fromRGBO(46,146,112,1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    final path = Path();

    path.moveTo( 0 , size.height* 0.13 );
    path.quadraticBezierTo( size.width * 0.6 , 20, size.width, size.height * 0.13 );
    path.lineTo( size.width , size.height * 0.43 );
    path.quadraticBezierTo( size.width * 0.8, size.height * 0.45 , size.width * 0.83 , size.height * 0.55 );
    path.quadraticBezierTo( size.width * 0.85, size.height * 0.6 , size.width  , size.height * 0.63 );
    path.quadraticBezierTo( size.width * 0.7, size.height * 0.9 , 0  , size.height * 0.9 );
    path.lineTo( 0, size.height * 0.43);
    path.lineTo( size.width * 0.1, size.height * 0.41);
    path.lineTo( 0, size.height * 0.35 );
    path.lineTo( 0 , size.height* 0.13 );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}