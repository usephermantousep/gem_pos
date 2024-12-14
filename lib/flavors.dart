enum Flavor {
  dev,
  uat,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'GEMPOS DEV';
      case Flavor.uat:
        return 'GEMPOS UAT';
      case Flavor.prod:
        return 'GEMPOS';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://192.168.1.5:8000';
      case Flavor.uat:
        return 'https://uat-elite.gias.co.id';
      case Flavor.prod:
        return 'https://elite.gias.co.id';
      default:
        return 'title';
    }
  }
}
