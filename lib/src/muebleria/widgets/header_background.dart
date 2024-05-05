import 'package:agenda_app/src/muebleria/utils/gradients.dart';
import 'package:flutter/material.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft:  Radius.circular( 120 ),
          bottomRight: Radius.circular( 120 )
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: Gradients.stepsColorListHome,
          colors: Gradients.gradientColorListHome
        ),
      ),
    );
  }
}