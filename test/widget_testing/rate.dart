import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/screens/login.dart';
import 'package:my_diet_guide/screens/rate.dart';

void main(){

  group("Widget testing Rate", () {

    testWidgets("Add new rating", (widgetTester) async{
      final firestore = FakeFirebaseFirestore();

      final auth = MockFirebaseAuth(
        mockUser: MockUser(
          isAnonymous: false,
          uid: 'rhaenys2',
          email: 'rhaenys@meeleys.com',
          displayName: 'Rhaenys',
        ),
        signedIn: true
      );
      await widgetTester.pumpWidget(
          MaterialApp(
              home: Rate(firestore: firestore, auth: auth)
          )
      );

      // verify feedback text is typing
      await widgetTester.enterText(find.byKey(Key("feedback-text")), "I love this app");
      expect(find.text('I love this app'), findsOneWidget);

      // Feedback add check
      await widgetTester.tap(find.byKey(Key('review-add-button')));
      await widgetTester.pump();
      expect(find.text('Your review added.'), findsOneWidget);
      await widgetTester.pump();
      expect(find.descendant(of: find.byKey(Key('reviews-column')), matching: find.text('rhaenys@meeleys.com')), findsOneWidget);
      expect(find.descendant(of: find.byKey(Key('reviews-column')), matching: find.text('I love this app')), findsOneWidget);


    });


  });



}