import 'package:http/http.dart' as http;
import 'dart:convert';
class Network{
  Network(this.url);
  final String url;
  Future getData()async{
    http.Response r=await http.get(Uri.parse(url));
    if(r.statusCode==200){
      String data=r.body;
      return jsonDecode(data);

    }
    else{
      print(r.statusCode);
    }
  }
}