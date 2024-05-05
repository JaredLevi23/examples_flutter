import 'package:flutter/material.dart';

import '../widgets/card_mueble.dart';
import '../widgets/header_background.dart';
import '../widgets/header_menu.dart';
import '../widgets/item_mueble.dart';

class MuebleHomePage extends StatelessWidget {

  const MuebleHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          const HeaderMenu(),

          Expanded(
            child: SingleChildScrollView(

              child: Column(
                children: [
          
                  SizedBox(
                    width: double.infinity,
                    height: 350,
                    child: Stack(
                      children: const [
                        HeaderBackground(),
                        CardMueble(
                          url: 'https://www.pngall.com/wp-content/uploads/2017/03/Recliner-Free-Download-PNG.png',
                          //url: 'https://www.mueblesboal.com.mx/uploads/products/small_63191a8f08b88463.jpeg',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    children: const [
                      ItemMueble(
                        url: 'https://www.mueblesboal.com.mx/uploads/products/small_63191a8fa2143922.jpeg',
                      ),
                      ItemMueble(
                        url: 'https://www.pngall.com/wp-content/uploads/2017/03/Recliner-PNG-File.png',
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      ItemMueble(
                        url: 'https://pngall.com/wp-content/uploads/2017/03/Recliner-Transparent.png',
                      ),
                      ItemMueble(),
                    ],
                  ),
          
                ],
              ),
            ),
          ),
          
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          size: 30,
          color: Colors.blueGrey,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        items: const [

          BottomNavigationBarItem(
            icon: Icon( Icons.home ),
            label: 'Home'
          ),

          BottomNavigationBarItem(
            icon: Icon( Icons.shopping_cart_outlined ),
            label: 'Favo'
          ),

          BottomNavigationBarItem(
            icon: Icon( Icons.message ),
            label: 'Message'
          ),

          BottomNavigationBarItem(
            icon: Icon( Icons.history ),
            label: 'History'
          ),

        ]
      ),
    );
  }
}