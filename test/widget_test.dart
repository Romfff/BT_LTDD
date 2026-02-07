import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:baitap3_ltdd/main.dart';

void main() {
  testWidgets('App runs without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Kiểm tra app có MaterialApp hay không
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
