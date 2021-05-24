import 'abstract_request.dart';
import 'default_request.dart';

class BalanceRequestBody extends AbstractRequestBody {
  List<String> address = [];
  late AbstractRequestBody defaultBody;

  BalanceRequestBody.defaultBody() {
    defaultBody = DefaultRequestBody();
  }

  BalanceRequestBody.specialBody(AbstractRequestBody specialBody) {
    defaultBody = specialBody;
  }

  void addAddress(String address) {
    this.address.add(address);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonBody = defaultBody.toJson();
    try {
      jsonBody.addAll({
        "method": "GetBalance",
        "jsonrpc": "2.0",
        "params": address,
      });
    } catch (exception) {
      var a = exception.toString();
    }

    return jsonBody;
  }
}
