import 'abstract_request.dart';

class DefaultRequestBody extends AbstractRequestBody {
  Map<String, dynamic> toJson() {
    return {
      "id": "1",
      "jsonrpc": "2.0",
    };
  }
}
