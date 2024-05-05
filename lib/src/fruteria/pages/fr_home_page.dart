import 'package:flutter/material.dart';

class FrHomePage extends StatelessWidget {
const FrHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        height: double.infinity,
        

        child: Stack(
          children: [

            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular( 20),
                  bottomRight: Radius.circular( 20),
                ),
                color: Color.fromRGBO( 251 , 187, 93, 1)
              ),
              child: Column(
                children: [

                  const Spacer(),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    padding: const EdgeInsets.all( 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        TextButton(
                          child: Column(
                            children: const [
                              Icon( Icons.home, color: Colors.white,),
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )  
                            ],
                          ),
                          onPressed: (){}, 
                        ),

                        TextButton(
                          child: Column(
                            children: const [
                              Icon( Icons.favorite_border, color: Colors.white,),
                              Text(
                                'Favorite',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )  
                            ],
                          ),
                          onPressed: (){}, 
                        ),

                        TextButton(
                          child: Column(
                            children: const [
                              Icon( Icons.shopping_cart, color: Colors.white,),
                              Text(
                                'My cart',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )  
                            ],
                          ),
                          onPressed: (){}, 
                        ),
                        TextButton(
                          child: Column(
                            children: const [
                              Icon( Icons.person, color: Colors.white,),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )  
                            ],
                          ),
                          onPressed: (){}, 
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.86,
              padding: const EdgeInsets.only( top: 25, left: 20, right: 20, bottom: 25 ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(251, 243, 221, 1 ),
                    Color.fromRGBO(250, 245, 230, 1 ),
                    Color.fromRGBO(234, 244, 208, 1 ),
                  ]
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular( 70 ),
                  bottomRight: Radius.circular( 70 ),
                )
              ),

              child: Column(
                children: [

                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                  
                        const Text(
                          'Daily\nGrocery Food',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                  
                        MaterialButton(
                          //shape: CircleBorder(),
                          minWidth: 80,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular( 50 )
                          ),
                          child: Container(
                            width: 80,
                            height: 110,
                            decoration: BoxDecoration(
                              border: Border.all( color: Colors.white, width: 3 ),
                              borderRadius: BorderRadius.circular( 50 )
                            ),
                            child: const Icon(
                              Icons.search,
                              size: 50,
                            )
                          ),
                          onPressed: (){

                          }
                        ),

                  
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(

                      children: [

                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              FrTagButton(
                                label: 'Frutas',
                                onPressed: (){},
                                isEnable: true,
                              ),
                              FrTagButton(
                                isEnable: false,
                                label: 'FastFood',
                                onPressed: (){},
                              ),
                              FrTagButton(
                                label: 'Vegetales',
                                onPressed: (){},
                                isEnable: false,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 8,
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
                              mainAxisExtent: 260
                            ), 
                            itemBuilder: (context, index) => Card(
                              
                              color: Colors.amber.shade50.withOpacity( 0.95 ),
                              child: Container(
                                padding: const EdgeInsets.only( top: 5, left: 5, right: 5 ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Center(
                                      child: Icon( 
                                        Icons.adf_scanner_sharp,
                                        size: 120,
                                        color: Colors.amber.shade900,
                                      ),
                                    ),

                                    const Text('Orange'),

                                    Row(
                                      children: const [

                                        Icon( Icons.star, color: Colors.amber, ),
                                        Icon( Icons.star, color: Colors.amber, ),
                                        Icon( Icons.star, color: Colors.amber, ),
                                        Icon( Icons.star, color: Colors.amber, ),
                                        Icon( Icons.star, color: Colors.amber, ),

                                      ],
                                    ),

                                    const Text(
                                      '\$1.25/kg',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    const Spacer(),


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        MaterialButton(
                                          minWidth: 40,
                                          color: Colors.amber,
                                          child: const Icon( Icons.favorite, color: Colors.white, ),
                                          onPressed: (){}
                                        ),
                                      ],
                                    )
                              
                                  ],
                                ),
                              ),
                            )
                          )
                        )

                      ],

                    )
                  )

                ],
              ),
            
            )

          ],
        ),
      ),

    );
  }
}

class FrTagButton extends StatelessWidget {

  final String label;
  final bool isEnable;
  final Function()? onPressed;

  const FrTagButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.isEnable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal:  10 ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: isEnable ? const MaterialStatePropertyAll<Color>( Color.fromRGBO( 251 , 187, 93, 1) ): const MaterialStatePropertyAll<Color>( Colors.transparent ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            )
          ),
        ),
        child: Text( label, style: TextStyle( fontSize: 15, color: isEnable ? Colors.white : Colors.black ),),
      ),
    );
  }
}