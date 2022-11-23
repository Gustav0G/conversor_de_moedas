import 'package:conversor_de_moedas/model/moedas_model.dart';
import 'package:dio/dio.dart';

class MoedaRepository {
  final Dio dio;
  MoedaRepository(this.dio);

  Future getCoinFromUrl() async {
    final response = await dio
        .get('https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL');

    return response.data;
  }

  Future<MoedasModel> getCoinUsd() async {
    Map<String, dynamic> list;
    list = await getCoinFromUrl();
    final usdList = MoedasModel.fromJson(list['USDBRL']);
    return usdList;
  }

  Future<MoedasModel> getCoinEur() async {
    Map<String, dynamic> list;
    list = await getCoinFromUrl();
    final eurList = MoedasModel.fromJson(list['EURBRL']);
    return eurList;
  }
}
