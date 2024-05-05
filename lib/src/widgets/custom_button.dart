import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? labelColor;

  const CustomButton({Key? key, this.onPressed, required this.label, this.backgroundColor, this.labelColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: backgroundColor ?? Colors.deepOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 55 )
      ),
      child:  SizedBox(
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: labelColor ?? Colors.white
            ),
          )
        ),
      ),
      onPressed: onPressed
    );
  }
}