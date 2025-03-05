enum Flavor {
  dev,
  stg,
  live,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Rajanigandha Dev';
      case Flavor.stg:
        return 'Rajanigandha Staging';
      case Flavor.live:
        return 'Rajanigandha';
      default:
        return 'Rajanigandha';
    }
  }

}
