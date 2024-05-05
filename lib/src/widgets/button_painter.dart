import 'package:agenda_app/src/utils/painters/painter_semi_circular.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ButtonPainter extends StatelessWidget {
  const ButtonPainter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      color: Colors.blueGrey,
      child: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: CustomPaint(
                painter: PainterSemiCircular(),
              ),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Transform.rotate(
                angle: math.pi,
                child: CustomPaint(
                  painter: PainterSemiCircular(),
                ),
              ),
            ),
            Container(
              padding: const  EdgeInsets.only( left: 15 ),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Listar Tareas',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
      onPressed: (){

    });
  }
}
