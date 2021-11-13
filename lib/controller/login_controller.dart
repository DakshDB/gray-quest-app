import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;


var _prefs;

login(String username, String password) async {
  _prefs = await SharedPreferences.getInstance();
  if(!checkIfUserExists(username)){
    await createUser(username, password);
  }
  return await loginUser(username, password);

}
checkIfUserExists(String username) {
  var loginKey = _prefs.getString(username);
  if(loginKey!=null) {
    return true;
  }
  return false;
}

createUser(String username, String password) async {
  _prefs.setString(username, password);
}

loginUser(String username, String password) async {
  _prefs = await SharedPreferences.getInstance();
  var loginKey = _prefs.getString(username);
  if(loginKey == password) {
    return Random().nextInt(10);
  }
  return -1;
}
