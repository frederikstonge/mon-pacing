@Tags(['integration'])
library;

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/parser.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mon_pacing/integrations/citrus_integration.dart';
import 'package:mon_pacing/models/improvisation_model.dart';
import 'package:mon_pacing/models/improvisation_type.dart';
import 'package:mon_pacing/models/pacing_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Citrus static data', () {
    const url = 'https://test.com/citrus';
    late CitrusIntegration citrusIntegration;
    late DioAdapter dioAdapter;

    setUp(() {
      final dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(dio: dio);
      citrusIntegration = CitrusIntegration(client: dio);
    });

    test('integrationIsValid should return true if path starts with integrationId', () {
      expect(citrusIntegration.integrationIsValid(url), isTrue);
    });

    test('integrationIsValid should return false if path doesn\'t starts with integrationId', () {
      expect(citrusIntegration.integrationIsValid('https://test.com/citron'), isFalse);
    });

    test(
      'getMatch should throw an exception if improvisation length is lower than ${CitrusIntegration.MinNumberOfImprovisations}',
      () async {
        final pacing = PacingModel(
          id: 1,
          name: 'Pacing',
          createdDate: DateTime.now(),
          modifiedDate: DateTime.now(),
          improvisations: List.generate(
            CitrusIntegration.MinNumberOfImprovisations - 1,
            (index) => ImprovisationModel(
              id: index,
              order: index + 1,
              type: ImprovisationType.values.elementAt(index % 2),
              category: '',
              theme: '',
              durationsInSeconds: [Duration(minutes: 2).inSeconds],
              performers: '',
              notes: '',
            ),
          ),
        );

        expect(() async => await citrusIntegration.getMatch(url, pacing), throwsA(isA<Exception>()));
      },
    );

    test(
      'getMatch should throw an exception if improvisation length is higher than ${CitrusIntegration.MaxNumberOfImprovisations}',
      () async {
        final pacing = PacingModel(
          id: 1,
          name: 'Pacing',
          createdDate: DateTime.now(),
          modifiedDate: DateTime.now(),
          improvisations: List.generate(
            CitrusIntegration.MaxNumberOfImprovisations + 1,
            (index) => ImprovisationModel(
              id: index,
              order: index + 1,
              type: ImprovisationType.values.elementAt(index % 2),
              category: '',
              theme: '',
              durationsInSeconds: [Duration(minutes: 2).inSeconds],
              performers: '',
              notes: '',
            ),
          ),
        );

        expect(() async => await citrusIntegration.getMatch(url, pacing), throwsA(isA<Exception>()));
      },
    );

    test('getMatch should return match when data is good', () async {
      final pacing = PacingModel(
        id: 1,
        name: 'Pacing',
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        improvisations: List.generate(
          12,
          (index) => ImprovisationModel(
            id: index,
            order: index + 1,
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
      dioAdapter.onGet(
        url,
        (server) => server.reply(
          200,
          html,
          headers: const {
            Headers.contentTypeHeader: ['text/html'],
          },
        ),
      );

      final match = await citrusIntegration.getMatch(url, pacing);
      expect(match, isNotNull);
      expect(match.teams.length, 2);
      expect(match.teams[0].performers.length, 6);
      expect(match.teams[1].performers.length, 7);
      expect(match.integrationId, citrusIntegration.integrationId);
      expect(match.integrationEntityId, '9292');
      expect(match.integrationAdditionalData, isNotNull);
      final exportData = jsonDecode(match.integrationAdditionalData!);
      expect(exportData['csrfToken'], isNotNull);
    });
  });

  group('Citrus web data', () {
    late CitrusIntegration citrusIntegration;
    late Dio dio;
    final url =
        'https://citrus.liguedespamplemousses.com/Citrus/Match-0379f292b8db8d7a6e560a2e62410084d3abf74a2775d026a0524a17afc47014/';

    setUp(() {
      dio = Dio();
      citrusIntegration = CitrusIntegration(client: dio);
    });

    test('Html body is the same', () async {
      final html = File('./test/integrations/static_data.html').readAsStringSync();
      final staticDocument = parse(html);

      staticDocument.head!.querySelector('meta[name=csrf-token]')!.attributes['content'] = 'csrftoken';
      staticDocument.body!.querySelector('form input[name=csrfmiddlewaretoken]')!.attributes['value'] = 'csrftoken';

      final response = await dio.get<String>(url.toString());
      final document = parse(response.data);

      document.head!.querySelector('meta[name=csrf-token]')!.attributes['content'] = 'csrftoken';
      document.body!.querySelector('form input[name=csrfmiddlewaretoken]')!.attributes['value'] = 'csrftoken';

      expect(document.body!.innerHtml, staticDocument.body!.innerHtml);
    });

    test('integrationIsValid should return true', () {
      expect(citrusIntegration.integrationIsValid(url), isTrue);
    });

    test('getMatch should return match when data is good', () async {
      final pacing = PacingModel(
        id: 1,
        name: 'Pacing',
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        improvisations: List.generate(
          12,
          (index) => ImprovisationModel(
            id: index,
            order: index + 1,
            type: ImprovisationType.values.elementAt(index % 2),
            category: '',
            theme: '',
            durationsInSeconds: [Duration(minutes: 2).inSeconds],
            performers: '',
            notes: '',
          ),
        ),
      );

      final match = await citrusIntegration.getMatch(url, pacing);
      expect(match, isNotNull);
      expect(match.teams.length, 2);
      expect(match.teams[0].performers.length, 6);
      expect(match.teams[1].performers.length, 7);
      expect(match.integrationId, citrusIntegration.integrationId);
      expect(match.integrationEntityId, '9292');
      final exportData = jsonDecode(match.integrationAdditionalData!);
      expect(exportData['csrfToken'], isNotNull);
    });
  });
}
