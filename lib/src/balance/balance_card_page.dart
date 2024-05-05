import 'package:flutter/material.dart';

class BalanceCardPage extends StatelessWidget {

  const BalanceCardPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
    
        body: SingleChildScrollView(
          child: Column(
            children: [
    
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.indigo,
                margin: const EdgeInsets.all( 20 ),
              )
    
            ],
          ),
        )
    
      ),
    );
  }
}