import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String listKey = "listKey";

  void storeStringList(String key,List<String> list) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setStringList(listKey, list);
  }

  Future<List<String>> getStringList() async {
    _preferences = await SharedPreferences.getInstance();
    return await _preferences.getStringList(listKey);
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString(key) ?? defValue;
  }

  // put string
  static Future<bool> saveString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences.setString(key, value);
  }

  // clear string
  static Future<bool> clrString() {
    SharedPreferences prefs = _preferences;
    prefs.clear();
  }

  List<String> _getList() {
    return _preferences.getStringList("key");
  }
}
