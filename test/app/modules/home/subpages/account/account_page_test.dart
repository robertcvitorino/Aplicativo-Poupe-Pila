import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:poupe/app/modules/home/subpages/account/account_page.dart';

main() {
  testWidgets('AccountPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AccountPage(title: 'Account')));
    final titleFinder = find.text('Account');
    expect(titleFinder, findsOneWidget);
  });
}
