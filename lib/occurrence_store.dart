
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OccurrenceStore {
  static final ValueNotifier<int> count = ValueNotifier<int>(0);

  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final occurrences =
        prefs.getStringList('territory_occurrences') ?? [];

    count.value = occurrences.length;
  }

  static Future<void> refresh() async {
    await load();
  }
}
