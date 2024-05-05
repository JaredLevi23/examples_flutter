import 'package:agenda_app/src/balance/balance_card_page.dart';
import 'package:agenda_app/src/balance/balance_init_page.dart';
import 'package:agenda_app/src/balance/balance_message_page.dart';
import 'package:agenda_app/src/balance/providers/balance_provider.dart';
import 'package:agenda_app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'balance_settings_page.dart';

class BalanceHomePage extends StatelessWidget {

  const BalanceHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    final balanceProvider = Provider.of<BalanceProvider>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: balanceProvider.currentPage,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(
            icon: Icon( Icons.person ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.message ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.credit_card ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.settings ),
            label: ''
          ),
        ],

        onTap: ( value ){
          balanceProvider.currentPage = value;
        },
      ),

      body: const _Pages()
    );
  }
}

class _Pages extends StatelessWidget {

const _Pages({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context){

  final currentPage = Provider.of<BalanceProvider>(context).currentPage;

    switch ( currentPage ) {
      case 0:
        return const BalanceInitPage();
      case 1: 
      return const BalanceMessagePage();
      case 2: 
      return const BalanceCardPage();
      case 3: 
      return const BalanceSettingsPage();
      default:
    }

    return Container();
  }
}
