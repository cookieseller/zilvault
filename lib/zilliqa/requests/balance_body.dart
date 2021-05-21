import 'default_body.dart';
import 'abstract_body.dart';

class BalanceBody extends AbstractBody {
  List<String> address = [];
  AbstractBody defaultBody;

  BalanceBody.defaultBody() {
    defaultBody = DefaultBody();
  }

  BalanceBody.specialBody(AbstractBody specialBody) {
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
