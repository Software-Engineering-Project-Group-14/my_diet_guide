

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/models/Model.dart';
import 'package:my_diet_guide/models/ProgressRecorder.dart';

import 'dietPlan_test.dart';

Future<void> addSampleData(firestore, auth, uid, email)async{
  String birthday = "1987/10/11";
  String firstName = "Rhenys";
  String lastName = "Targaryen";
  await firestore.collection('user').doc(uid).set({
    'birthday': birthday,
    'email':email,
    'first name':firstName,
    'last name':lastName,
    'user_id':uid
  });
  await firestore.collection('user biometrics').doc(uid).set({
    'activeness': 'Active',
    'age': 32,
    'dietary_preference': 'Vegetarian',
    'gender': 'Male',
    'height': 180,
    'intensity': 'Standard',
    'target weight': 60,
    'user_id': uid,
    'weight': 70,
    'calculated_current_weight': 70
  });
  List<String> ids = await addSamplePlans();
  expect(ids.length, 2);
  DietPlanModel? dietPlanModel = await DietPlanModel.get(ids[0]);
  bool val = await dietPlanModel!.select(user_id: uid);
  expect(val, true);
}

void main() async{

  group("Record Progress", () {
    group("Recording breakfast", () {
      test("progress : Did not complete", () async{
        String meal = 'breakfast';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Did not complete";
        await ProgressRecorder.recordProgress(uid, date, 'breakfast', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Partially Completed", () async{
        String meal = 'breakfast';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Partially Completed";
        await ProgressRecorder.recordProgress(uid, date, 'breakfast', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Completed", () async{
        String meal = 'breakfast';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Completed";
        await ProgressRecorder.recordProgress(uid, date, 'breakfast', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Over ate", () async{
        String meal = 'breakfast';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Over ate";
        await ProgressRecorder.recordProgress(uid, date, 'breakfast', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
    });
    group("Recording lunch", () {
      test("progress : Did not complete", () async{
        String meal = 'lunch';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Did not complete";
        await ProgressRecorder.recordProgress(uid, date, 'lunch', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Partially Completed", () async{
        String meal = 'lunch';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Partially Completed";
        await ProgressRecorder.recordProgress(uid, date, 'lunch', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Completed", () async{
        String meal = 'lunch';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Completed";
        await ProgressRecorder.recordProgress(uid, date, 'lunch', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Over ate", () async{
        String meal = 'lunch';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Over ate";
        await ProgressRecorder.recordProgress(uid, date, 'lunch', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
    });
    group("Recording dinner", () {
      test("progress : Did not complete", () async{
        String meal = 'dinner';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Did not complete";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Partially Completed", () async{
        String meal = 'dinner';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Partially Completed";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Completed", () async{
        String meal = 'dinner';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Completed";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("progress : Over ate", () async{
        String meal = 'dinner';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Over ate";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        final ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
    });

    group("Change record progress", (){
      test("Change from Completed to Over ate", () async{
        String meal = 'dinner';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Completed";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        DocumentSnapshot ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
        progress = "Over ate";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });
      test("Change from Did not complete to Partially Completed", () async{
        String meal = 'dinner';
        String uid = 'rhaenys2';
        String email = 'rhaenys@meeleys.com';
        final auth = MockFirebaseAuth(
            mockUser: MockUser(
              isAnonymous: false,
              uid: uid,
              email: email,
              displayName: 'Rhaenys',
            ),
            signedIn: true
        );
        final firestore = FakeFirebaseFirestore();
        Model.init(auth: auth, firestore: firestore);
        await addSampleData(firestore, auth, uid, email);
        DateTime date = DateTime.now();
        String dish = "Dish 1";
        String progress = "Did not complete";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        DocumentSnapshot ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
        progress = "Partially Completed";
        await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
        ds = await firestore.collection('record progress').doc(uid + DateTime(date.year, date.month, date.day).toString() + meal).get();
        expect(ds['dish'],dish);
        expect(ds["progress"], progress);
      });

    });

    test("invalid inputs", () async{
      String meal = 'dinner';
      String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );
      final firestore = FakeFirebaseFirestore();
      Model.init(auth: auth, firestore: firestore);
      await addSampleData(firestore, auth, uid, email);
      DateTime date = DateTime.now();
      String dish = "Dish 1";
      String progress = "Cometed";
      final res = await ProgressRecorder.recordProgress(uid, date, 'dinner', dish, progress );
      expect(res['success'],false);
      expect(res["msg"], MessageConstants.invalidProgressRecord);

    });

  });


}