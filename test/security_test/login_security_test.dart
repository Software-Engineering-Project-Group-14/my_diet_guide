import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/screens/login.dart';

void main() {

  group('Test Login Security', () {

    testWidgets('Correct Credentials', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      await widgetTester.pumpWidget(
          MaterialApp(
              home: Login(firestore: firestore, auth: auth)
          )
      );

      await widgetTester.enterText(find.byKey(Key('email')), 'userrr@gmail.com');
      expect(find.text('userrr@gmail.com'), findsOneWidget);

      await widgetTester.enterText(find.byKey(Key("password")), "userpassword");
      expect(find.text('userpassword'), findsOneWidget);

      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(find.text("Success"), findsOneWidget);
    });
  });

}