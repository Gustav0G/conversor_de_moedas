import 'dart:convert';

import 'package:conversor_de_moedas/model/moedas_model.dart';
import 'package:conversor_de_moedas/repository/moeda_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response {}

void main() {
  test('O teste foi Validado', () async {
    //arrange
    final response = ResponseMock();
    when(() => response.data).thenReturn(jsonDecode(jsonText));
    final dio = DioMock();
    when(() => dio.get(any())).thenAnswer((invocation) async => response);
    final repository = MoedaRepository(dio);

    //act
    final result = await repository.getCoinFromUrl();

    //Assert
    expect(result, isA<Map<String, dynamic>>());
    expect(result, contains('USDBRL'));
    expect(result, contains('EURBRL'));

    //when(dio)
  });

  test('USD teste foi Validado', () async {
    //Arrange
    final response = ResponseMock();
    when(() => response.data).thenReturn(jsonDecode(jsonText));
    final dio = DioMock();
    when(() => dio.get(any())).thenAnswer((invocation) async => response);
    final repository = MoedaRepository(dio);

    //act
    final result = await repository.getCoinUsd();

    //Assert
    expect(result, isA<MoedasModel>());
    expect(result.code, equals('USD'));
    expect(result, isNotNull);
  });

  test('Eur teste foi Validado', () async {
    //Arrange
    final response = ResponseMock();
    when((() => response.data)).thenReturn(jsonDecode(jsonText));
    final dio = DioMock();
    when(() => dio.get(any())).thenAnswer((invocation) async => response);
    final repository = MoedaRepository(dio);
    //Act
    final result = await repository.getCoinEur();
    //Assert
    expect(result, isA<MoedasModel>());
    expect(result.code, equals('EUR'));
    expect(result, isNotNull);
  });
}

const jsonText =
    r''' 
{
  "USDBRL":{
    "code":"USD",
    "codein":"BRL",
    "name":"Dólar Americano/Real Brasileiro",
    "high":"5.2629","low":"5.261",
    "varBid":"-0.0016","pctChange":"-0.03",
    "bid":"5.2605","ask":"5.2615","timestamp":"1665710501",
    "create_date":"2022-10-13 22:21:41"},
  "EURBRL":{
    "code":"EUR","codein":"BRL","name":"Euro/Real Brasileiro",
    "high":"5.1585","low":"5.1357","varBid":"0.009",
    "pctChange":"0.17","bid":"5.1521","ask":"5.1542",
    "timestamp":"1665713637","create_date":"2022-10-13 23:13:57"}}

''';
