

import '../Providers/shorten_api_provider.dart';
import '../models/shortenlink_model.dart';


class ApiRepository {
  final _provider = ApiProvider();

  Future<ShortenLinkModel> fetchDataList(url) {
    return _provider.fetchDataList(url);
  }
}

class NetworkError extends Error {}