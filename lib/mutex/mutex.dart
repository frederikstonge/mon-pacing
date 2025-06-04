import 'dart:async';
import 'dart:collection';

import 'package:uuid/uuid.dart';

class Mutex {
  static Uuid uuid = Uuid();
  static ListQueue<String> queue = ListQueue<String>();

  static Future<T> protect<T>(FutureOr<T> Function() action) async {
    final lockId = uuid.v4();
    queue.addLast(lockId);
    while (queue.first != lockId) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    try {
      return await action();
    } finally {
      queue.removeFirst();
    }
  }
}
