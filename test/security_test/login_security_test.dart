import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/login.dart';

void main() {

  group('Test Login Security', () {

    testWidgets('Correct Credentials', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();

      auth.createUserWithEmailAndPassword(
          email: 'userrr@gmail.com', password: 'password1234');
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(
          MaterialApp(home: Login()));

      await widgetTester.enterText(
          find.byKey(Key('email')), 'userrr@gmail.com');
      expect(find.text('userrr@gmail.com'), findsOneWidget);

      await widgetTester.enterText(find.byKey(Key("password")), "password1234");
      expect(find.text('password1234'), findsOneWidget);

      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(find.text("Success"), findsOneWidget);
    });

    testWidgets('Empty email & password', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(
          MaterialApp(home: Login()));

      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(find.text('Can\'t be empty'), findsNWidgets(2));
    });

    testWidgets('Only Empty Email', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(
          MaterialApp(home: Login()));

      final emailFormField = find.byKey(const Key('email'));
      final passwordFormField = find.byKey(const Key('password'));

      await widgetTester.enterText(find.byKey(Key('password')), 'password1234');
      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(
          find.descendant(
              of: emailFormField, matching: find.text('Can\'t be empty')),
          findsOneWidget);
    });

    testWidgets('Only Empty Password', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(
          MaterialApp(home: Login()));

      final emailFormField = find.byKey(const Key('email'));
      final passwordFormField = find.byKey(const Key('password'));

      await widgetTester.enterText(
          find.byKey(Key('email')), 'userrr@gmail.com');
      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(
          find.descendant(
              of: passwordFormField, matching: find.text('Can\'t be empty')),
          findsOneWidget);
    });

    testWidgets('Invalid email', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(
          MaterialApp(home: Login()));

      await widgetTester.enterText(find.byKey(Key('email')), 'userr#gmail.com');
      await widgetTester.tap(find.byKey(Key("login-button")));
      await widgetTester.pump();
      expect(find.text('Enter a valid email'), findsOneWidget);
    });

    testWidgets('Invalid User Credentials', (widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth();
      Controller.init(firestore: firestore, auth: auth);
      auth.createUserWithEmailAndPassword(email: 'userrr@gmail.com', password: 'password1234');

      await widgetTester.pumpWidget(
          MaterialApp(home: Login()));

      await widgetTester.enterText(
          find.byKey(Key('email')), 'wronguser@gmail.com');
      await widgetTester.enterText(find.byKey(Key('password')), 'wronguserpw');
      await widgetTester.tap(find.byKey(Key('login-button')));
      await widgetTester.pump();

      expect(find.text('Login credentials are invalid.'), findsNothing);
    });
  });
}
