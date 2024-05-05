import 'package:flutter/material.dart';
class BalanceMessagePage extends StatelessWidget {


  const BalanceMessagePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (_, index) => const Divider(),
        itemBuilder: ( _, index ){
          return SizedBox(
            height: 80,
            width: double.infinity,
            child: Row(
              children: [

                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all( 5 ),
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    shape: BoxShape.circle
                  ),
                  child: const Icon( 
                    Icons.person_2, 
                    color: Colors.white, 
                    size: 40, 
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        'Jared Levi', 
                        style: TextStyle( 
                          fontSize: 18, 
                          fontWeight: FontWeight.bold 
                        ),
                      ),

                      Row(
                        children: const [
                          
                          Expanded(
                            child: Text(
                              'Este es un pedazo del ultimo mensaje que recibiste',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Text('12:20 am'),
                        ],
                      )

                    ],
                  ),
                )

              ],
            ),
          );
        }
      )

    );
  }
}