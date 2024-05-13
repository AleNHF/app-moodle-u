class AuthTokenResponse {
  final String token;
  final String? privatetoken;

  AuthTokenResponse({
    required this.token, 
    this.privatetoken
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) {
    return AuthTokenResponse(
      token: json['token'],
      privatetoken: json['privatetoken'],
    );
  }
}