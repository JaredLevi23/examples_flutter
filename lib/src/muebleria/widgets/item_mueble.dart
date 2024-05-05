import 'package:flutter/material.dart';

class ItemMueble extends StatelessWidget {

  final String url;
  const ItemMueble({Key? key, this.url = 'https://pngall.com/wp-content/uploads/12/Furniture-Drawer-PNG-Clipart.png' }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 15 ),
          border: Border.all( color: Colors.grey ),
          color: Colors.black12.withOpacity( 0.05 )
        ),
        margin: const EdgeInsets.all( 10 ),
        padding: const EdgeInsets.all( 4 ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 15 ),
                child: FadeInImage(
                  image: NetworkImage( url ),
                  imageErrorBuilder: ( _, __, ___ ) => Image.asset('assets/imgs/no-image.png'),
                  placeholder: const AssetImage('assets/imgs/loading.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Text(
              '\$4.50', 
              style: TextStyle( 
                fontSize: 16, 
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),

            const Text(
              'Silver Chair', 
              style: TextStyle( 
                fontSize: 17, 
                color: Colors.black 
              ),
            ),

            const Text('Buy now')

          ],
        ),
      ),
    );
  }
}