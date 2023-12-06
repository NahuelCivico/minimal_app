class ApiBaseResponse {
  final bool isSuccessful;
  final String message;
  final dynamic data;

  ApiBaseResponse({
    required this.isSuccessful,
    required this.message,
    required this.data,
  });

  factory ApiBaseResponse.fromMap(Map<String, dynamic> map) {
    return ApiBaseResponse(
      isSuccessful: map['success'] == true,
      message: map['error'] != null ? map['error']['message'] : '',
      data: map['response'] != null
          ? map['response'] is bool
              ? map['response']
              : map['response']['data'] ?? map['response']
          : null,
    );
  }
}
