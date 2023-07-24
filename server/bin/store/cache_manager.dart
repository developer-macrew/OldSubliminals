import 'dart:async';

import 'package:common/common.dart';

import '../services/locator.dart';

/// Really simple thing for now that just forces stores to push
/// their caches every few minutes.
class CacheManager {
  final Duration interval;
  CacheManager({this.interval = const Duration(minutes: 5)}) {
    init();
  }

  void init() {
    Timer.periodic(interval, (_) => pushCaches());
  }

  void pushCaches() async {
    String _unwrap(String title, Result<Iterable<String>> result) {
      String r = result.ok ? result.object!.length.toString() : 'Error: ${result.error}';
      return ('::::: $title: $r');
    }

    final users = await userStore().pushCache();
    print(':::::::::::::::::::::::::::::::');
    print('[Cache Manager]: pushing caches');
    print('[Cache Manager]: finished');
    print(_unwrap('Users', users));
    print(':::::::::::::::::::::::::::::::');
  }
}
