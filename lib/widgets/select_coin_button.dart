import 'package:conversor_de_moedas/controller/moeda_controller.dart';
import 'package:conversor_de_moedas/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCoinButton extends StatefulWidget {
  const SelectCoinButton({Key? key}) : super(key: key);

  @override
  State<SelectCoinButton> createState() => _SelectCoinButtonState();
}

int _selectedCoin = 0;

class _SelectCoinButtonState extends State<SelectCoinButton> {
  @override
  Widget build(BuildContext context) {
    void changeIndex(int index) {
      setState(() {
        _selectedCoin = index;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Provider.of<MoedaController>(context, listen: false)
                .getAllMoedaUsd();
            changeIndex(0);
          },
          child: Container(
              height: 76,
              width: 129,
              decoration: _selectedCoin == 0
                  ? AppStyle().buttonBoxDecorationSelected
                  : AppStyle().buttonBoxDecoration,
              child: Center(
                child: Text(
                  'USD',
                  style: _selectedCoin == 0
                      ? AppStyle().buttonTextStyleSelected
                      : AppStyle().buttonTextStyle,
                ),
              )),
        ),
        InkWell(
          onTap: () {
            changeIndex(1);
            Provider.of<MoedaController>(context, listen: false)
                .getAllMoedasEur();
          },
          child: Container(
              height: 76,
              width: 129,
              decoration: _selectedCoin == 1
                  ? AppStyle().buttonBoxDecorationSelected
                  : AppStyle().buttonBoxDecoration,
              child: Center(
                child: Text(
                  'EUR',
                  style: _selectedCoin == 1
                      ? AppStyle().buttonTextStyleSelected
                      : AppStyle().buttonTextStyle,
                ),
              )),
        ),
      ],
    );
  }
}
