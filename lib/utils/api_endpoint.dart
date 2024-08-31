class ApiEndpoint{
  static final String baseUrl = 'https://api.c4cem.org/v1/';
  static final String imageUrl = '127.0.0.1:3000/v1';

  static final _AuthEndpoint auth = _AuthEndpoint();
  static final _PostEndpoint post = _PostEndpoint();
}

class _AuthEndpoint{
  final String login = 'users/login';
}

class _PostEndpoint{

}