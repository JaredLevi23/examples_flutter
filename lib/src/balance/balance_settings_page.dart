import 'package:flutter/material.dart';

class BalanceSettingsPage extends StatelessWidget {

  const BalanceSettingsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
    
        body: SingleChildScrollView(
          child: Column(
            children: [
    
              ListTile(
                title: const Text('Cuenta'),
              )
    
            ],
          ),
        )
    
      ),
    );
  }
}