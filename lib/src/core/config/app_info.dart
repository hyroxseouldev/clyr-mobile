class AppInfo {
  AppInfo._();

  static const String appName = 'clyr_mobile';
  static const String version = '1.0.0';
  static const int buildNumber = 1;
  static const String packageName = 'com.example.clyr_mobile';
  static const String appLogoText = 'CLYR';

  static String get fullVersion => '$version+$buildNumber';
}
