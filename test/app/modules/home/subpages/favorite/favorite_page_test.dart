import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/home/subpages/favorite/favorite_page.dart';

main() {
  testWidgets('FavoritePage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(FavoritePage(title: 'Favorite')));
    final titleFinder = find.text('Favorite');
    expect(titleFinder, findsOneWidget);
  });
}
