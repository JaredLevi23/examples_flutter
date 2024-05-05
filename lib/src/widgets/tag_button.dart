import 'package:flutter/material.dart';

class TagButton extends StatefulWidget {

  const TagButton({Key? key}) : super(key: key);

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 50 ),
        ),
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric( horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular( 50 ),
            border: Border.all( 
              color: isSelected ? Colors.green :Colors.grey,
              width: 1
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon( Icons.monetization_on ),
              const SizedBox( width: 10, ),
              const Text('Trekking'),
              if( isSelected )
                const Icon( Icons.done, color: Colors.green, )
            ],
          ),
        ),
        onPressed: () => setState( ()=> isSelected = !isSelected )
      ),
      onTap: (){
        print('PRESIONE');
      },
    );
  }
}