import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/login/subpages/create/create_page.dart';

main() {
  testWidgets('CreatePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CreatePage(title: 'Create')));
    final titleFinder = find.text('Create');
    expect(titleFinder, findsOneWidget);
  });
}
