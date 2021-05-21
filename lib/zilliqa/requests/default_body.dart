import 'abstract_body.dart';

class DefaultBody extends AbstractBody{
  Map<String, dynamic> toJson() {
    return {
      "id": "1",
      "jsonrpc": "2.0",
    };
  }
}
