import 'package:conversor_de_moedas/widgets/card_widget.dart';
import 'package:conversor_de_moedas/widgets/select_coin_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/moeda_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    Provider.of<MoedaController>(context, listen: false).getAllMoedaUsd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 50,
            ),
            SelectCoinButton(),
            SizedBox(
              height: 100,
            ),
            CardWidget(),
          ],
        ),
      ),
    );
  }
}
