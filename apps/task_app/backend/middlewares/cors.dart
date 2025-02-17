import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use((handler) => (context) async {
    if (context.request.method == HttpMethod.options) {
      return Response(body: 'OK', statusCode: 200, headers: _corsHeaders);
    }

    final response = await handler(context);
    return response.copyWith(headers: {
      ...response.headers,
      ..._corsHeaders,
    });
  });
}

const _corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': '*',
};
