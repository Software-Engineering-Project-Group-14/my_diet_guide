import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/screens/user_profile.dart';

void main() {

  group('User Details display by retrieving data from firestore database', () {
    testWidgets("Render to user dashboard", (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true);

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await firestore.collection('user biometrics').add({
        'activeness': 'Active',
        'age': 32,
        'dietary_preference': 'Low carb',
        'gender': 'Male',
        'height': 180,
        'intensity': 'Standard',
        'target weight': 60,
        'user_id': '12dewfwbbbqwbadhebwqb',
        'weight': 70
      });
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(),
      ));

      expect(find.byKey(Key('user-dashboard')), findsOneWidget);
    });

    testWidgets("Bottom bar displayed", (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true);

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await firestore.collection('user biometrics').add({
        'activeness': 'Active',
        'age': 32,
        'dietary_preference': 'Low carb',
        'gender': 'Male',
        'height': 180,
        'intensity': 'Standard',
        'target weight': 60,
        'user_id': '12dewfwbbbqwbadhebwqb',
        'weight': 70
      });
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(),
      ));

      expect(find.byKey(Key('bottom-bar')), findsOneWidget);

      //expect(find.byKey(Key('user-details')), findsOneWidget);
      //expect(find.byKey(Key('user-biometrics')), findsOneWidget);
    });

    testWidgets("User Profile displayed", (WidgetTester widgetTester) async {
      final firestore = FakeFirebaseFirestore();
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: '12dewfwbbbqwbadhebwqb',
            email: 'userrr@gmail.com',
          ),
          signedIn: true);

      await firestore.collection('user').add({
        'user_id': '12dewfwbbbqwbadhebwqb',
        'email': 'userrr@gmail.com',
        'first name': 'Rachel',
        'last name': 'Green',
        'birthday': '1990/12/20',
        'current_plan': '40'
      });

      await firestore.collection('user biometrics').add({
        'activeness': 'Active',
        'age': 32,
        'dietary_preference': 'Low carb',
        'gender': 'Male',
        'height': 180,
        'intensity': 'Standard',
        'target weight': 60,
        'user_id': '12dewfwbbbqwbadhebwqb',
        'weight': 70
      });
      Controller.init(firestore: firestore, auth: auth);
      await widgetTester.pumpWidget(MaterialApp(
        home: UserDashboard(),
      ));

      expect(find.byKey(Key('bottom-bar')), findsOneWidget);

      await widgetTester.tap(find.byKey(Key('user-profile-btn')));

      await widgetTester.pumpWidget(MaterialApp(
        home: UserProfile(),
      ));

      expect(find.text('User Profile'), findsOneWidget);
      //expect(find.byKey(Key('user-details')), findsOneWidget);
      //expect(find.byKey(Key('user-biometrics')), findsOneWidget);
    });
  });
}
