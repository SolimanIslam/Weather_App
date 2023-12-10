import 'package:http/http.dart' as http;
// so that every time we use a method from this library we know that this method is from the 'http.dart' file
import 'dart:convert'; //to access the json file sent by the site (API provider)

//  URL [json file (weather Data)] >>> NetworkHelper >>>Decoded json file

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    //Uri.parse is used to be able to enter string values.
    String data = response.body;

    if (response.statusCode == 200) {
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
