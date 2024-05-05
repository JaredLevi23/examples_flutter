import 'package:flutter/material.dart';
class BalanceInitPage extends StatelessWidget {


  const BalanceInitPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
      
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
      
                  child: Stack(
                    children: [
      
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 30,
                            ),
                            Text('Total balance', style: TextStyle( fontSize: 23, fontWeight: FontWeight.w400 ) ),
                            Text('231.68', style: TextStyle( fontSize: 35, fontWeight: FontWeight.bold ) ),
                          ],
                        ),
                      ),
      
                      Positioned(
                        top: 40,
                        right: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular( 15 )
                          ),
                          child: IconButton(
                            iconSize: 35,
                            color: Colors.indigo,
                            icon: const Icon( Icons.notifications_outlined ),
                            onPressed: (){
      
                            }, 
                          ),
                        )
                      )
                    ],
                  ),
                ),
      
                Container(
                  padding: const EdgeInsets.all( 10 ),
                  width: double.infinity,
                  height: 360,
                  child: Column(
                    children: [
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
      
                          const Text(
                            'Transacciones',
                            style: TextStyle(
                              fontSize: 23
                            ),
                          ),
      
                          MaterialButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular( 15 )
                            ),
                            color: Colors.black,
                            child: const Text('Ver todo', style: TextStyle( color: Colors.white ),),
                            onPressed: (){}
                          )
                        ],
                      ),
      
                      const SizedBox(
                        height: 5,
                      ),
      
                      _Transaction(),
                      _Transaction(),
                      _Transaction(),
      
                    ],
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.all( 10 ),
                  width: double.infinity,
                  
                  child: Column(
                    children: [
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
      
                          const Text(
                            'Gastos',
                            style: TextStyle(
                              fontSize: 23
                            ),
                          ),
      
                          MaterialButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular( 15 )
                            ),
                            color: Colors.black,
                            child: const Text('Detalles', style: TextStyle( color: Colors.white ),),
                            onPressed: (){}
                          )
                        ],
                      ),
      
                      Row(
                        children: [
                          
                          _Graph( 
                            text: 'Hoy', 
                            value: '1270', 
                            backgroundColor: Colors.black12,
                          ),
      
                          _Graph( 
                            text: 'Este mes', 
                            value: '4800', 
                            backgroundColor: Colors.black12,
                          ),
                          
                        ],
                      )
      
                    ],
                  ),
                ),
      
              ],
            ),
          ),
      ),
    );
  }
}


class _Transaction extends StatelessWidget {
  const _Transaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.all( 15 ),
      margin: EdgeInsets.only( bottom: 5 ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular( 15 )
      ),
      child: Row(
        children: [

          Container(
            margin: const EdgeInsets.only( right: 10 ),
            width: 70,
            height: 70,
            child: Icon( Icons.person ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular( 15 ),
              color: Colors.grey,
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Instagram Reel'),
                    Text('Jared Levi', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
                  ],
                ),
          
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${ DateTime.now().toString().split(' ')[0] }'),
                    Text('\$500.00', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
                  ],
                ),
          
              ],
            ),
          )

        ],
      ),
    );
  }
}

class _Graph extends StatelessWidget {

const _Graph({ 
  Key? key,
  required this.text,
  required this.value,
  this.fontColor,
  this.backgroundColor
}) : super(key: key);

  final String text;
  final String value;
  final Color? backgroundColor;
  final Color? fontColor;

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.all( 10 ),
        padding: const EdgeInsets.all( 10 ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.orangeAccent,
          borderRadius: BorderRadius.circular( 15 )
        ),
        child: Column(
          children: [
            Text( text, style: TextStyle( fontSize: 16, color: fontColor ?? Colors.black ),),
            Expanded(
              child: Container(
                
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( value, style: TextStyle( fontSize: 16, color: fontColor ?? Colors.black ),),
                const Icon( Icons.arrow_forward_ios_outlined ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}