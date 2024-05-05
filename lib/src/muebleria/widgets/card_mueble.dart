import 'package:flutter/material.dart';

class CardMueble extends StatelessWidget {

  final String url;
  const CardMueble({Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( right: 20, left: 20 ),
      height: 350,
      child: Column(
        children: [

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular( 15 ),
              child: FadeInImage(
                //image: const AssetImage('assets/imgs/no-image.png'),
                image: NetworkImage(url,),
                placeholder: const AssetImage('assets/imgs/loading.gif'),
                imageErrorBuilder: (_, __, ___) => const Center( child: Icon( Icons.image_not_supported_rounded )),
                fit: BoxFit.cover,
              ),
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [

              Text(
                'Silver Chair', 
                style: TextStyle( 
                  fontSize: 25, 
                  color: Colors.black 
                ),
              ),

              Text(
                '\$4.50', 
                style: TextStyle( 
                  fontSize: 25, 
                  color: Colors.black 
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          const Text(
            'Pon la descripcion del elemento aqui, esta es la desxripcion del elemento',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 17
            ),
          ),

        ],
      ),
    );
  }
}