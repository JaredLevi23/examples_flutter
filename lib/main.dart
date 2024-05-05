import 'package:agenda_app/src/home_page.dart';
import 'package:agenda_app/src/agenda/providers/agenda_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/balance/providers/balance_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AgendaProvider() ),
        ChangeNotifierProvider(create: (_)=>BalanceProvider() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple
          )
        ),
        routes: {
          'home':(context) => const HomePage()
        },
      ),
    );
  }
}