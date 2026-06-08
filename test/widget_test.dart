import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portafolio_app_web/src/features/projects/domain/projects.dart';
import 'package:portafolio_app_web/src/widgets/app_loading_indicator.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

void main() {
  group('Projects', () {
    test('parses localized JSON fields and optional APK URL', () {
      final project = Projects.fromJson({
        'id': 'demo',
        'name': {'en': 'Portfolio', 'es': 'Portafolio'},
        'description': {'en': 'Website', 'es': 'Sitio web'},
        'link': 'https://mauriciopamplona.com',
        'image_url': 'https://example.com/project.png',
        'apk_url': 'https://example.com/app.apk',
      });

      expect(project.name['es'], 'Portafolio');
      expect(project.description['en'], 'Website');
      expect(project.imageUrl, 'https://example.com/project.png');
      expect(project.apkUrl, 'https://example.com/app.apk');
    });
  });

  group('NullableUrlString', () {
    test('accepts only http and https network URLs', () {
      const validUrl = 'https://example.com/app.apk';
      const invalidScheme = 'ftp://example.com/app.apk';
      const relativePath = '/downloads/app.apk';
      const emptyUrl = '';

      expect(validUrl.validNetworkUrl, validUrl);
      expect(invalidScheme.validNetworkUrl, isNull);
      expect(relativePath.validNetworkUrl, isNull);
      expect(emptyUrl.validNetworkUrl, isNull);
    });
  });

  group('AppLoadingIndicator', () {
    testWidgets('keeps the circular indicator in a square box', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SizedBox(
            width: 320,
            height: 160,
            child: AppLoadingIndicator(size: 40),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(CircularProgressIndicator)),
        const Size.square(40),
      );
    });
  });
}
