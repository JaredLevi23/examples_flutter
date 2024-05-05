
import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration taskDecoration( { required String hintText } ){
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle( fontSize: 17, color: Colors.black87 ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular( 25 ),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular( 25 ),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular( 25 ),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular( 25 ),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
          width: 2
        ),
      ),
    );
  } 

}