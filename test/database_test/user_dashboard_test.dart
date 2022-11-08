import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';

void main(){
  group('User Dashboard - Database Tests', () {
    testWidgets('Retrieving data from database to User Dashboard', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();

      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true
      );

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(firestore: firestore, auth: auth),
      ));

      expect(find.byKey(Key('user-dashboard')), findsOneWidget);
    });


    testWidgets('Dispalying retrieved data from database on dashboard', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();

      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true
      );

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(firestore: firestore, auth: auth),
      ));

      expect(find.byKey(Key('user-dash-body')), findsOneWidget);
    });

    testWidgets('Breakfast Meal Info is displayed', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();

      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true
      );

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(firestore: firestore, auth: auth),
      ));

      expect(find.byKey(Key('user-dash-body')), findsOneWidget);
    });

    testWidgets('Lunch Meal Info is displayed', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();

      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true
      );

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(firestore: firestore, auth: auth),
      ));

      expect(find.byKey(Key('user-dash-body')), findsOneWidget);
    });


    testWidgets('Dinner Meal Info is displayed', (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();

      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true
      );

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(firestore: firestore, auth: auth),
      ));

      expect(find.byKey(Key('user-dash-body')), findsOneWidget);
    });


  });
}