class RoutingData {
  final String route;
  final Map<String, String> _queryParameters;

  RoutingData({
    this.route,
    Map<String, String> queryParemeters,
  }) : _queryParameters = queryParemeters;

  operator [](String key) => _queryParameters[key];
}
