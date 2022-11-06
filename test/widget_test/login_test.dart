import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/screens/login.dart';

void main() {
  group("Log in widget", () {

    testWidgets('Valid Credential', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      await widgetTester.pumpWidget(
          MaterialApp(
              home: Login(firestore: firestore, auth: auth)
          )
      );

      // verify email is typing
      await widgetTester.enterText(find.byKey(Key("email")), "thalia@thalia.com");
      expect(find.text('thalia@thalia.com'), findsOneWidget);

      // verify password is typing
      await widgetTester.enterText(find.byKey(Key("password")), "thaliathalia");
      expect(find.text('thaliathalia'), findsOneWidget);

      // verify for valid credential
      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(find.text("Success"), findsOneWidget);

      // verify for invalid credential
      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(find.text("Success"), findsOneWidget);

    });

    testWidgets('Inalid Log in', (WidgetTester tester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      await tester.pumpWidget(
          MaterialApp(
              home: Login(firestore: firestore, auth: auth)
          )
      );

      final emailFormField = find.byKey(const Key('email'));
      final passwordFormField = find.byKey(const Key('password'));

      // Empty Email
      await tester.tap(find.byKey(Key("login-button")));
      await tester.pump();
      expect(find.descendant(of: emailFormField, matching: find.text('Can\'t be empty')), findsOneWidget);

      await tester.enterText(find.byKey(Key("email")), "thalia@thalia.com");
      // Empty Password
      await tester.pump();
      expect(find.descendant(of: passwordFormField, matching: find.text('Can\'t be empty')), findsOneWidget);

      // Invalid email format
      await tester.enterText(find.byKey(Key("email")), "thaliathalim");
      await tester.enterText(find.byKey(Key("password")), "thalihalia");
      await tester.tap(find.byKey(Key("login-button")));
      await tester.pump();
      expect(find.descendant(of: emailFormField, matching: find.text('Enter a valid email')), findsOneWidget);

      /*
      // verify for invalid credential
      await tester.tap(find.byKey(Key("login-button")));
      await tester.pump();
      expect(find.text("Login credentials are invalid."), findsOneWidget);
      */
    });

  });


}
