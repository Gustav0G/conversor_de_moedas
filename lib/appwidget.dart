import 'package:conversor_de_moedas/controller/moeda_controller.dart';
import 'package:conversor_de_moedas/repository/moeda_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MultiProvider(
        providers: [
          //Provider(create: (context) => MoedaRepository(Dio())),
          ChangeNotifierProvider(
            create: (context) => MoedaController(MoedaRepository(Dio())),
          ),
        ],
        child: const Homepage(),
      ),
    );
  }
}
