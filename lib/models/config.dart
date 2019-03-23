class Config {
  String url;
  String token;
  String email;

  static final Config _config = Config._internal();

  factory Config() {
    return _config;
  }

  Config._internal() {
    this.url = "http://app-ebbc73fa-3dff-4f13-b1bb-d2c960e025d1.cleverapps.io";
  }
}
