import 'dart:async';

class Mutex {
  static bool _locked = false;

  static Future<T> protect<T>(FutureOr<T> Function() action) async {
    while (_locked) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    _locked = true;
    try {
      return await action();
    } finally {
      _locked = false;
    }
  }
}
