import 'app_prefrerence.dart';

class OnboardStorageKey {
  static const String isFirstOpenKey = 'is_first_open_key';
}

class OnboardService {
  static void saveOnboardToLocal() {
    final pres = AppPreference.preferences;
    pres?.setBool(OnboardStorageKey.isFirstOpenKey, true);
  }

  static bool isFirstOpen() {
    final pres = AppPreference.preferences;
    return pres?.getBool(OnboardStorageKey.isFirstOpenKey) ?? true;
  }
}
