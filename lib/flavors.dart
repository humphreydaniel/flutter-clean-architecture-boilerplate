// ignore: constant_identifier_names
enum Flavor { DEV, STAGING, PROD }

// ignore: avoid_classes_with_only_static_members
class F {
  static Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'MyApp Dev';
      case Flavor.STAGING:
        return 'MyApp Staging';
      case Flavor.PROD:
        return 'MyApp';
      default:
        return 'title';
    }
  }
}
