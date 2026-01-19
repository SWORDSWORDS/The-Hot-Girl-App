import 'package:shared_preferences/shared_preferences.dart';

class DayChecker {
  static const String _lastCheckedDayKey = 'lastCheckedDay';

  /// Checks if a new day has started since the last time this function was called.
  /// Returns true if it's a new day, false otherwise.
  static Future<bool> isNewDay() async {
    final prefs = await SharedPreferences.getInstance();
    final int? lastCheckedDay = prefs.getInt(_lastCheckedDayKey);
    final int today = DateTime.now().weekday;

    if (lastCheckedDay == null) {
      // First time the app is run or the key is not set.
      // Save today's date and return true (consider it a "new day" for initial setup).
      await prefs.setInt(_lastCheckedDayKey, today);
      return true;
    }

    // Compare the day
    if (lastCheckedDay != today) {
      // It is a new day. Update the stored date.
      await prefs.setInt(_lastCheckedDayKey, today);
      return true;
    } else {
      // It is still the same day.
      return false;
    }
  }
}
