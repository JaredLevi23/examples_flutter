import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemButton extends StatelessWidget {
  final String title;
  final String lottieUrl;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? fontColor;

  const ItemButton({
    Key? key, 
    required this.onPressed,
    required this.title,
    required this.lottieUrl,
    this.backgroundColor,
    this.fontColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 30 )
      ),
      padding: EdgeInsets.zero,
      color: backgroundColor ?? Colors.deepPurple,
      child: Container(
        padding: const EdgeInsets.symmetric( horizontal: 20 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                child: Text( 
                  title,
                   style: TextStyle(
                    fontSize: 27,
                    color: fontColor ?? Colors.white,
                    fontWeight: FontWeight.bold
                   ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: 170,
              child: Lottie.network( 
                lottieUrl, 
                fit: BoxFit.fill
              )
            ),
          ],
        ),
      ),
      onPressed: onPressed
    );
  }
}