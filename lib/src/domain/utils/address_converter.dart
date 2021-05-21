import 'package:bech32/bech32.dart';

class AddressConverter {
  String convertBits(List data, int fromWidth, int toWidth) {
    int acc = 0;
    int bits = 0;
    var ret = [];
    String complete = '';
    var maxv = (1 << toWidth) - 1;
    for (var p = 0; p < data.length; ++p) {
      var value = data[p];
      if (value < 0 || value >> fromWidth != 0) {
        return null;
      }
      acc = (acc << fromWidth) | value;
      bits += fromWidth;
      while (bits >= toWidth) {
        bits -= toWidth;
        ret.add(((acc >> bits) & maxv).toRadixString(16));
      }
    }
    ret.forEach((element) {
      complete = complete + element.toString();
    });

    return complete;
  }

  String addr(String text) {
    try {
      Bech32 asd = bech32.decode(text);
      String list = '';
      asd.data.forEach((element) {
        list = list + element.toString();
      });
      return convertBits(asd.data, 5, 8);
    } catch (e) {
      print(e);
    }

    return "";
  }
}
