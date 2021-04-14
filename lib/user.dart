import 'package:firebase_auth/firebase_auth.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Everything in this class should be static. There is only one user, so instead of instantiating a new user
/// object whenever we use itm it is much cleaner to use one static class.
/// This class is essentially the "buisness logic" part of the app. So whenever you need to access Firebase or get
/// data from anywhere, place those methods in here.
///TODO: lol, actually put stuff in here


class User {
  ///TODO: static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore _fstore =   FirebaseFirestore.instance;
  static var currentUser;
  static Map _userData;


  static Future<void> initialize() async {
    currentUser = await _auth.currentUser;
    await getUserData();
    print("User Initialized");
  }

  static Future<void> getUserData() async {
    var userID = currentUser.id;
    await _fstore.collection('Users').where('id', isEqualTo: "$userID");
    List<int> vals = [];

  }

  static Future<void> inputData(String data) async {
    print(data);
  }


  /// User this for testing purposes!
  static List<DataPoint> getSampleData() {
    return [
      DataPoint<DateTime>(value: 10, xAxis: DateTime.now().subtract(Duration(days: 2))),
      DataPoint<DateTime>(value: 50, xAxis: DateTime.now().subtract(Duration(days: 3))),
      DataPoint<DateTime>(value: 60, xAxis: DateTime.now().subtract(Duration(days: 6))),
      DataPoint<DateTime>(value: 70, xAxis: DateTime.now().subtract(Duration(days: 10))),
      DataPoint<DateTime>(value: 1, xAxis: DateTime.now().subtract(Duration(days: 20))),
      DataPoint<DateTime>(value: 5, xAxis: DateTime.now().subtract(Duration(days: 22))),
      DataPoint<DateTime>(value: 1, xAxis: DateTime.now().subtract(Duration(days: 25))),
      DataPoint<DateTime>(value: 5, xAxis: DateTime.now().subtract(Duration(days: 26))),
      DataPoint<DateTime>(value: 1, xAxis: DateTime.now().subtract(Duration(days: 27))),
      DataPoint<DateTime>(value: 59, xAxis: DateTime.now().subtract(Duration(days: 28))),
      DataPoint<DateTime>(value: 69, xAxis: DateTime.now().subtract(Duration(days: 30))),
      DataPoint<DateTime>(value: 69, xAxis: DateTime.now().subtract(Duration(days: 45))),
      DataPoint<DateTime>(value: 66, xAxis: DateTime.now().subtract(Duration(days: 46))),
      DataPoint<DateTime>(value: 99, xAxis: DateTime.now().subtract(Duration(days: 48))),
      DataPoint<DateTime>(value: 10, xAxis: DateTime.now().subtract(Duration(days: 50))),
      DataPoint<DateTime>(value: 50, xAxis: DateTime.now().subtract(Duration(days: 60))),
    ];
  }
}

