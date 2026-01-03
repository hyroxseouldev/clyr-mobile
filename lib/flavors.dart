enum Flavor {
  dev,
  stage,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return '[DEV] Clyr Mobile';
      case Flavor.stage:
        return '[STG] Clyr Mobile';
      case Flavor.prod:
        return 'Clyr Mobile';
    }
  }

}
