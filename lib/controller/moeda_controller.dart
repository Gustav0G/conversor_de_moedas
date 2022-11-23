import 'package:conversor_de_moedas/model/moedas_model.dart';
import 'package:conversor_de_moedas/repository/moeda_repository.dart';
import 'package:flutter/cupertino.dart';

class MoedaController extends ChangeNotifier {
  final _moedaUsd = MoedasModel.empty();
  final _moedasEur = MoedasModel.empty();
  MoedasModel _coins = MoedasModel.empty();

  final MoedaRepository moedaRepository;
  MoedaController(this.moedaRepository);

  Future<void> getAllMoedaUsd() async {
    _coins = await moedaRepository.getCoinUsd();
    notifyListeners();
  }

  Future<void> getAllMoedasEur() async {
    _coins = await moedaRepository.getCoinEur();
    notifyListeners();
  }

  get coin => _coins;
  get usd => _moedaUsd;
  get eur => _moedasEur;
}
