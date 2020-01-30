import 'package:the_basics/datamodels/routing_data.dart';

extension StringExtension on String {
  RoutingData get routingData {
    var uriData = Uri.parse(this);
    return RoutingData(
      queryParemeters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}
