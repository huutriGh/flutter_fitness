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

  List<Session> getSession() {
    List<Session> sessions = [];

    Set<String> keys = prefs.getKeys();
    for (var key in keys) {
      if (key != 'counter') {
        Session session = Session.fromJson(
          json.decode(prefs.getString(key) ?? ''),
        );
        sessions.add(session);
      }
    }

    return sessions;
  }

  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }

  Future deleteSession(int id) async {
    prefs.remove(id.toString());
  }
}
