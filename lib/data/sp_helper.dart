import 'dart:convert';

import 'package:fitness_app/models/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  static late SharedPreferences prefs;
  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    await prefs.setString(
        session.id.toString(),
        json.encode(
          session.toJson(),
        ));
  }
}
