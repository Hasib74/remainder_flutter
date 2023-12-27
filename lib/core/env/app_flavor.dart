enum Flavor {
  development,
  staging,
  release;

  String get flavorName {
    switch (this) {
      case Flavor.development:
        return 'development';
      case Flavor.staging:
        return 'staging';
      default:
        return 'release';
    }
  }
}

class BuildConfig {
  final Flavor flavor;
  final String? flavorName;

  static late BuildConfig? _instance;

  static BuildConfig get() {
    if (_instance == null) {
      throw Exception('BuildConfig has not been initialized yet.');
    }
    return _instance!;
  }

  BuildConfig._({required this.flavor, required this.flavorName});

  BuildConfig._development()
      : this._(
            flavor: Flavor.development,
            flavorName: Flavor.development.flavorName);

  BuildConfig._staging()
      : this._(flavor: Flavor.staging, flavorName: Flavor.staging.flavorName);

  BuildConfig._release()
      : this._(flavor: Flavor.release, flavorName: Flavor.release.flavorName);

  static void init({Flavor? flavor}) {
    switch (flavor) {
      case Flavor.development:
        _instance = BuildConfig._development();
        break;
      case Flavor.staging:
        _instance = BuildConfig._staging();
        break;
      default:
        _instance = BuildConfig._release();
    }
  }
}
