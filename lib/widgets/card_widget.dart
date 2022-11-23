import 'package:conversor_de_moedas/controller/moeda_controller.dart';
import 'package:conversor_de_moedas/model/moedas_model.dart';
import 'package:conversor_de_moedas/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoedaController>(builder: (context, value, child) {
      MoedasModel coin = value.coin;

      TextEditingController coinController = TextEditingController(text: '1.0');
      TextEditingController brlController =
          TextEditingController(text: coin.bid.toString());

      return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 30,
          color: const Color(0xff212121),
          child: Container(
            height: 275,
            width: 346,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Column(
              children: [
                Text(
                  'R\$ ${coin.bid}',
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          coin.code,
                          style: AppStyle().cardTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: 120,
                          color: Colors.white,
                        ),
                        Text(
                          'Alta: ${coin.high}',
                          style: AppStyle().cardTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Baixa: ${coin.low}',
                          style: AppStyle().cardTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: 120,
                          color: Colors.white,
                        ),
                        Text(
                          'Variação: ${coin.pctChange}',
                          style: AppStyle().cardTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('  BRL'),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 43,
                          width: 161,
                          decoration: AppStyle().boxDecoration,
                          child: TextField(
                            readOnly: true,
                            controller: brlController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              //hintText: coin.bid.toString(),
                              contentPadding: EdgeInsets.all(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(coin.code),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 43,
                          width: 161,
                          decoration: AppStyle().boxDecoration,
                          child: TextField(
                            controller: coinController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.]'))
                            ],
                            onChanged: (value) {
                              if (coinController.text.isNotEmpty) {
                                brlController.clear();
                                brlController.text = coin.bid.toString();
                                var result = double.parse(brlController.text) *
                                    double.parse(coinController.text);
                                brlController.text = result.toStringAsFixed(2);
                              }
                            },
                            decoration: AppStyle().inputDecoration,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Data: ${coin.createDate}')
              ],
            ),
          ));
    });
  }
}
