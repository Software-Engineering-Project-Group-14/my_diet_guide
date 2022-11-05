import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/screens/user_profile.dart';

void main() {
  testWidgets("User Profile Displayed", (WidgetTester widgetTester) async {
    final firestore = FakeFirebaseFirestore();

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

    final auth = MockFirebaseAuth(
        mockUser: MockUser(
          isAnonymous: false,
          uid: '12dewfwbbbqwbadhebwqb',
          email: 'userrr@gmail.com',
        ),
        signedIn: true);

    await widgetTester.pumpWidget(MaterialApp(
      home: UserProfile(firestore: firestore, auth: auth),
    ));

    expect(find.byKey(Key('user-details')), findsOneWidget);
    expect(find.byKey(Key('user-biometrics')), findsOneWidget);
  });
}
