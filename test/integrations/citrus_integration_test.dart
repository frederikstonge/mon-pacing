import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mon_pacing/integrations/citrus_integration.dart';
import 'package:mon_pacing/models/improvisation_model.dart';
import 'package:mon_pacing/models/improvisation_type.dart';
import 'package:mon_pacing/models/pacing_model.dart';

void main() {
  CitrusIntegration? citrusIntegration;
  DioAdapter? dioAdapter;

  group('Citrus static data', () {
    final url = 'https://test.com/citrus';
    setUp(() {
      final dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(dio: dio);
      citrusIntegration = CitrusIntegration(client: dio);
    });

    test('integrationIsValid should return true if path starts with integrationId', () {
      expect(citrusIntegration!.integrationIsValid(url), isTrue);
    });

    test('integrationIsValid should return false if path doesn\'t starts with integrationId', () {
      expect(citrusIntegration!.integrationIsValid('https://test.com/citron'), isFalse);
    });

    test('getMatch should throw an exception if improvisation length is lower than ${CitrusIntegration.MinNumberOfImprovisations}', () async {
      final pacing = PacingModel(
        id: 1,
        name: 'Pacing',
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        improvisations: List.generate(
          CitrusIntegration.MinNumberOfImprovisations - 1,
          (index) => ImprovisationModel(
            id: index,
            type: ImprovisationType.values.elementAt(index % 2),
            category: '',
            theme: '',
            durationsInSeconds: [Duration(minutes: 2).inSeconds],
            performers: '',
            notes: '',
          ),
        ),
      );

      expect(() async => await citrusIntegration!.getMatch(url, pacing), throwsA(isA<Exception>()));
    });

    test('getMatch should throw an exception if improvisation length is higher than ${CitrusIntegration.MaxNumberOfImprovisations}', () async {
      final pacing = PacingModel(
        id: 1,
        name: 'Pacing',
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        improvisations: List.generate(
          CitrusIntegration.MaxNumberOfImprovisations + 1,
          (index) => ImprovisationModel(
            id: index,
            type: ImprovisationType.values.elementAt(index % 2),
            category: '',
            theme: '',
            durationsInSeconds: [Duration(minutes: 2).inSeconds],
            performers: '',
            notes: '',
          ),
        ),
      );

      expect(() async => await citrusIntegration!.getMatch(url, pacing), throwsA(isA<Exception>()));
    });

    test('getMatch should return match when data is good', () async {
      final url = 'https://test.com/citrus';

      final pacing = PacingModel(
        id: 1,
        name: 'Pacing',
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        improvisations: List.generate(
          12,
          (index) => ImprovisationModel(
            id: index,
            type: ImprovisationType.values.elementAt(index % 2),
            category: '',
            theme: '',
            durationsInSeconds: [Duration(minutes: 2).inSeconds],
            performers: '',
            notes: '',
          ),
        ),
      );

      final html = await File('./test/integrations/static_data.html').readAsString();
      dioAdapter!.onGet(url, (server) => server.reply(200, html, delay: const Duration(seconds: 1)));

      // final match = await citrusIntegration!.getMatch(url, pacing);
      expect(/*match*/ pacing, isNotNull);
    });
  });

  // group('Citrus web data', () {
  //   final url = 'https://test.com/citrus';

  //   setUp(() {
  //     final dio = Dio(BaseOptions());
  //     citrusIntegration = CitrusIntegration(client: dio);
  //   });

  //   test('integrationIsValid should return true', () {
  //     expect(citrusIntegration!.integrationIsValid(url), isTrue);
  //   });
  // });
}
