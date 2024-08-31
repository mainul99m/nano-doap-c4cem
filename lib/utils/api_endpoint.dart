class ApiEndpoint{
  static final String baseUrl = 'https://api.c4cem.org/v1/';
  static final String imageUrl = 'https://assets.c4cem.org/';

  static final _AuthEndpoint auth = _AuthEndpoint();
  static final _PostEndpoint post = _PostEndpoint();
}

class _AuthEndpoint{
  final String login = 'users/login';
}

class _PostEndpoint{
  final String fish = 'fish';
  final String environment = 'environment';
  final String plankton = 'plankton';
  final String plastic = 'plastic';
  final String resource = 'resource';
}